import 'package:dartz/dartz.dart';

abstract class IGeminiService {
  const IGeminiService();

  Future<Either<String, Map<String, dynamic>?>> sendPromptToGemini(
    String prompt,
  );
}
