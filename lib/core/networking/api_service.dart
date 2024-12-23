import 'dart:developer';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiAPIService {
  final String apiKey;
  final String modelVersion;

  GeminiAPIService({
    required this.apiKey,
    this.modelVersion = 'gemini-1.5-flash',
  });

  Future<String?> generateContent(String prompt) async {
    try {
      final model = GenerativeModel(
        model: modelVersion,
        apiKey: apiKey,

      );
      final agriculturePrompt = "You are an agricultural expert. $prompt";

      final response = await model.generateContent([Content.text(agriculturePrompt)]);

      return response.text;
    } catch (e) {
      log('Error generating content: $e');
      return null;
    }
  }
}