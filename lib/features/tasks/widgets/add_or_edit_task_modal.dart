import 'dart:io';
import 'package:abstracta_ivo/app/utils/utils.dart';
import 'package:abstracta_ivo/features/features.dart';
import 'package:abstracta_ivo/l10n/arb/app_localizations.dart';
import 'package:abstracta_ivo/l10n/l10n.dart';
import 'package:abstracta_repository/model/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrEditTaskModal extends StatefulWidget {
  const AddOrEditTaskModal({super.key, this.existingTask});
  final TaskModel? existingTask;

  @override
  State<AddOrEditTaskModal> createState() => _AddOrEditTaskModalState();
}

class _AddOrEditTaskModalState extends State<AddOrEditTaskModal> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleCtrl;
  late final TextEditingController _descCtrl;
  late final TextEditingController _assignCtrl;
  late final TextEditingController _aiPromptCtrl;
  final TextEditingController _tagInputCtrl = TextEditingController();
  late TaskStatus _status;
  bool _useAi = true;

  List<String> _tags = [];

  bool get isEditing => widget.existingTask != null;

  @override
  void initState() {
    super.initState();
    final t = widget.existingTask;
    _titleCtrl = TextEditingController(text: t?.title ?? '');
    _descCtrl = TextEditingController(text: t?.description ?? '');
    _assignCtrl = TextEditingController(text: t?.assignedTo ?? '');
    _aiPromptCtrl = TextEditingController();
    _status = t?.status ?? TaskStatus.pending;
    if (t != null) {
      _tags = List.from(t.tags);
    }
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _assignCtrl.dispose();
    _aiPromptCtrl.dispose();
    _tagInputCtrl.dispose();
    super.dispose();
  }

  void _addTag(String raw) {
    final tag = raw.trim();
    if (tag.isEmpty || _tags.contains(tag)) return;
    setState(() => _tags.add(tag));
    _tagInputCtrl.clear();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final bloc = context.read<TaskActionBloc>();
    final title = _titleCtrl.text.trim();
    final description = _descCtrl.text.trim();
    final assignedTo = _assignCtrl.text.trim();
    final prompt = _aiPromptCtrl.text.trim();

    if (isEditing) {
      bloc.add(
        TaskActionEvent.editTask(
          title: title,
          description: description,
          status: _status,
          taskId: widget.existingTask!.id,
          assignedTo: assignedTo,
          labels: _tags,
        ),
      );
    } else {
      bloc.add(
        TaskActionEvent.addTask(
          title: title,
          description: description,
          assignedTo: assignedTo,
          prompt: prompt,
          labels: _tags,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 26,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(l10n),
            const SizedBox(height: 16),
            if (isEditing) ...[
              _buildStatusDropdown(l10n),
              const SizedBox(height: 16),
            ],
            if (!isEditing && _useAi) ...[
              const SizedBox(height: 16),
              _buildTextField(
                _aiPromptCtrl,
                l10n.iaInstructions,
                multiline: true,
                validator: l10n.descriptionRequired,
              ),
            ] else ...[
              _buildTextField(
                _titleCtrl,
                l10n.titleLabel,
                validator: l10n.titleRequired,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                _descCtrl,
                l10n.descriptionLabel,
                multiline: true,
                validator: l10n.descriptionRequired,
              ),
            ],
            const SizedBox(height: 16),
            _buildTagsField(l10n),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: _tags.map((tag) => Chip(label: Text(tag))).toList(),
            ),
            const SizedBox(height: 8),
            _buildTextField(
              _assignCtrl,
              l10n.assignedTo,
              validator: l10n.assignationRequired,
            ),
            const SizedBox(height: 24),
            _buildSubmitButton(l10n),
            if (isEditing) _buildDeleteButton(l10n),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          isEditing ? l10n.editTaskTitle : l10n.createTaskTitle,
          style: const TextStyle(fontSize: 22),
        ),
        if (!isEditing)
          Row(
            children: [
              Text(
                l10n.iaMode,
                style: TextStyle(
                  fontSize: 14,
                  color: _useAi ? Colors.green : Colors.grey,
                ),
              ),
              if (Platform.isIOS)
                CupertinoSwitch(
                  value: _useAi,
                  onChanged: (v) => setState(() => _useAi = v),
                )
              else
                Switch(
                  value: _useAi,
                  onChanged: (v) => setState(() => _useAi = v),
                ),
            ],
          ),
      ],
    );
  }

  Widget _buildStatusDropdown(AppLocalizations l10n) {
    return DropdownButtonFormField<TaskStatus>(
      value: _status,
      onChanged: (v) => setState(() => _status = v!),
      decoration: InputDecoration(
        labelText: l10n.statusLabel,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      items: TaskStatus.values.map((s) {
        return DropdownMenuItem(
          value: s,
          child: Text(
            StringUtils().capitalize(s.name),
            style: TextStyle(color: ColorsUtils().getStatusColor(s)),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTextField(
    TextEditingController ctrl,
    String label, {
    String? hint,
    bool multiline = false,
    String? validator,
  }) {
    return TextFormField(
      controller: ctrl,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
        alignLabelWithHint: multiline,
      ),
      keyboardType: multiline ? TextInputType.multiline : TextInputType.text,
      textInputAction:
          multiline ? TextInputAction.newline : TextInputAction.next,
      minLines: multiline ? 3 : 1,
      maxLines: multiline ? null : 1,
      validator: validator == null
          ? null
          : (v) => (v == null || v.trim().isEmpty) ? validator : null,
    );
  }

  Widget _buildTagsField(AppLocalizations l10n) {
    return TextFormField(
      controller: _tagInputCtrl,
      decoration: InputDecoration(
        labelText: l10n.tagsLabel,
        hintText: l10n.tagsHint,
        border: const OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.done,
      onFieldSubmitted: _addTag,
    );
  }

  Widget _buildSubmitButton(AppLocalizations l10n) {
    return BlocConsumer<TaskActionBloc, TaskActionState>(
      listener: (ctx, state) {
        if (state is ActionSucceded) Navigator.pop(ctx);
        if (state is ActionFailed) {
          ScaffoldMessenger.of(ctx).showSnackBar(
            SnackBar(
              content: Text(l10n.actionError),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.pop(ctx);
        }
      },
      builder: (ctx, state) {
        final loading = state is ActionLoading;
        return SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: loading ? null : _submit,
            child: loading
                ? const SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(),
                  )
                : Text(isEditing ? l10n.saveChanges : l10n.createTask),
          ),
        );
      },
    );
  }

  Widget _buildDeleteButton(AppLocalizations l10n) {
    return TextButton.icon(
      onPressed: () async {
        final ok = await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(l10n.deleteTaskQuestion),
            content: Text(l10n.deleteTaskDescription),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(l10n.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: Text(l10n.delete),
              ),
            ],
          ),
        );
        if (ok ?? false) {
          context
              .read<TaskActionBloc>()
              .add(TaskActionEvent.removeTask(taskId: widget.existingTask!.id));
        }
      },
      icon: const Icon(Icons.delete_outline, color: Colors.red),
      label: Text(l10n.deleteTask, style: const TextStyle(color: Colors.red)),
    );
  }
}
