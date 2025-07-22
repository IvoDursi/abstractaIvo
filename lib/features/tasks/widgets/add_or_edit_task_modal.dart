import 'dart:io';

import 'package:abstracta_ivo/app/utils/utils.dart';
import 'package:abstracta_ivo/features/features.dart';
import 'package:abstracta_ivo/l10n/l10n.dart';
import 'package:abstracta_repository/model/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrEditTaskModal extends StatefulWidget {
  const AddOrEditTaskModal({
    super.key,
    this.existingTask,
  });
  final TaskModel? existingTask;

  @override
  State<AddOrEditTaskModal> createState() => _AddOrEditTaskModalState();
}

class _AddOrEditTaskModalState extends State<AddOrEditTaskModal> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleCtrl;
  late final TextEditingController _descCtrl;
  late final TextEditingController _assignationCtrl;
  late TaskStatus _status;
  final TextEditingController _aiPromptCtrl = TextEditingController();
  bool _useAiMode = true;

  bool get isEditing => widget.existingTask != null;

  @override
  void initState() {
    super.initState();
    _titleCtrl = TextEditingController(text: widget.existingTask?.title ?? '');
    _descCtrl =
        TextEditingController(text: widget.existingTask?.description ?? '');
    _assignationCtrl =
        TextEditingController(text: widget.existingTask?.assignedTo ?? '');

    _status = widget.existingTask?.status ?? TaskStatus.pending;
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _assignationCtrl.dispose();
    _aiPromptCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final title = _titleCtrl.text.trim();
    final assignation = _assignationCtrl.text.trim();
    final description = _descCtrl.text.trim();
    final prompt = _aiPromptCtrl.text.trim();

    if (isEditing) {
      context.read<TaskActionBloc>().add(
            TaskActionEvent.editTask(
              title: title,
              description: description,
              status: _status,
              taskId: widget.existingTask!.id,
              assignedTo: assignation,
            ),
          );
    } else {
      context.read<TaskActionBloc>().add(
            TaskActionEvent.addTask(
              title: title,
              description: description,
              assignedTo: assignation,
              prompt: prompt,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                          color: _useAiMode ? Colors.green : Colors.grey,
                        ),
                      ),
                      if (Platform.isIOS)
                        CupertinoSwitch(
                          value: _useAiMode,
                          onChanged: (value) {
                            setState(() {
                              _useAiMode = value;
                            });
                          },
                        )
                      else
                        Switch(
                          value: _useAiMode,
                          onChanged: (value) {
                            setState(() {
                              _useAiMode = value;
                            });
                          },
                        ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 16),
            if (isEditing)
              DropdownButtonFormField<TaskStatus>(
                value: _status,
                onChanged: (newValue) {
                  if (newValue != null) {
                    setState(() {
                      _status = newValue;
                    });
                  }
                },
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorsUtils().getStatusColor(_status),
                ),
                decoration: InputDecoration(
                  filled: true,
                  labelText: l10n.statusLabel,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
                items: TaskStatus.values.map((option) {
                  return DropdownMenuItem(
                    value: option,
                    child: Text(
                      StringUtils().capitalize(option.name),
                      style: TextStyle(
                        color: ColorsUtils().getStatusColor(option),
                      ),
                    ),
                  );
                }).toList(),
              ),
            if (isEditing) ...[
              TextFormField(
                controller: _titleCtrl,
                decoration: InputDecoration(labelText: l10n.titleLabel),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.titleRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descCtrl,
                decoration: InputDecoration(
                  labelText: l10n.descriptionLabel,
                  border: const OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: null,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.descriptionRequired;
                  }
                  return null;
                },
              ),
            ] else if (!_useAiMode) ...[
              TextFormField(
                controller: _titleCtrl,
                decoration: InputDecoration(labelText: l10n.titleLabel),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.titleRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descCtrl,
                decoration: InputDecoration(
                  labelText: l10n.descriptionLabel,
                  border: const OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: null,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.descriptionRequired;
                  }
                  return null;
                },
              ),
            ] else ...[
              TextFormField(
                controller: _aiPromptCtrl,
                decoration: InputDecoration(
                  labelText: l10n.iaInstructions,
                  hintText: l10n.iaInstructionsHint,
                  border: const OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                keyboardType: TextInputType.multiline,
                minLines: 4,
                maxLines: null,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.descriptionRequired;
                  }
                  return null;
                },
              ),
            ],
            const SizedBox(height: 16),
            TextFormField(
              controller: _assignationCtrl,
              decoration: InputDecoration(labelText: l10n.assignedTo),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return l10n.assignationRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Center(
              child: BlocConsumer<TaskActionBloc, TaskActionState>(
                listener: (context, state) {
                  if (state is ActionSucceded) Navigator.pop(context);
                  if (state is ActionFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.actionError),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 3),
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: state is ActionLoading ? null : _submit,
                      child: state is ActionLoading
                          ? const SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              isEditing ? l10n.saveChanges : l10n.createTask,
                            ),
                    ),
                  );
                },
              ),
            ),
            if (isEditing)
              Center(
                child: TextButton.icon(
                  onPressed: () async {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(l10n.deleteTaskQuestion),
                        content: Text(
                          l10n.deleteTaskDescription,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: Text(l10n.cancel),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.red,
                            ),
                            child: Text(l10n.delete),
                          ),
                        ],
                      ),
                    );

                    if (confirm ?? false) {
                      context.read<TaskActionBloc>().add(
                            TaskActionEvent.removeTask(
                              taskId: widget.existingTask!.id,
                            ),
                          );
                    }
                  },
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  label: Text(
                    l10n.deleteTask,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}
