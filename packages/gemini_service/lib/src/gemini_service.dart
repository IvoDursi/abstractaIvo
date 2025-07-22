import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gemini_service/i_gemini_service.dart';
import 'package:http/http.dart' as http;

/// {@template gemini_service}
/// Gemini Service description
/// {@endtemplate}
class GeminiService extends IGeminiService {
  /// {@macro gemini_service}
  const GeminiService();

  @override
  Future<Either<String, Map<String, dynamic>?>> sendPromptToGemini(
    String prompt,
  ) async {
    final apikey = dotenv.env['GEMINI_API_KEY'];

    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apikey',
    );

    final body = jsonEncode(
      {
        'contents': [
          {
            'parts': [
              {
                'text':
                    "Dado el siguiente texto: \"$prompt\", generá una respuesta en formato JSON con un campo 'title' (máximo 10 palabras) y un campo 'description' (máximo 80 palabras) que describan una tarea de forma concisa. Ejemplo de formato de respuesta: {\"title\": \"Título aquí\", \"description\": \"Descripción aquí\"}",
              }
            ],
          }
        ],
      },
    );

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final generatedText =
            data['candidates'][0]['content']['parts'][0]['text'].toString();

        final match =
            RegExp(r'```json\s*([\s\S]*?)\s*```').firstMatch(generatedText);

        final cleanedText =
            match != null ? match.group(1)!.trim() : generatedText.trim();

        final parsed = jsonDecode(cleanedText);

        if (parsed is Map &&
            parsed['title'] != null &&
            parsed['description'] != null) {
          return Right({
            'title': parsed['title'].toString(),
            'description': parsed['description'].toString(),
          });
        }
      } else {
        return Left('Error ${response.statusCode}: ${response.body}');
      }
    } catch (e) {
      return Left('Error $e');
    }
    return const Left('Unknown error');
  }
}
