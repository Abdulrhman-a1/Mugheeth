import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechController extends ChangeNotifier {
  final SpeechToText _speech = SpeechToText();
  String _recognizedText = '';
  bool _isListening = false;
  BuildContext? context;

  String get recognizedText => _recognizedText;
  bool get isListening => _isListening;

  void setContext(BuildContext context) {
    context = context;
  }

  Future<void> initializeSpeech() async {
    await _speech.initialize(
      onError: (error) => log("Speech Error: ${error.errorMsg}"),
      onStatus: (status) => log("Speech Status: $status"),
    );
  }

  void startListening() {
    _recognizedText = '';
    _speech.listen(
      localeId: 'en-US',
      listenMode: ListenMode.dictation,
      onResult: _onSpeechResult,
    );
    _isListening = true;
    notifyListeners();
  }

  void stopListening() {
    _speech.stop();
    _isListening = false;
    notifyListeners();
  }

  void toggleListening() {
    if (_isListening) {
      stopListening();
    } else {
      startListening();
    }
  }

  void clearRecognizedText() {
    _recognizedText = '';
    notifyListeners();
  }

  String getAndClearText() {
    String text = _recognizedText.trim();
    clearRecognizedText();
    return text;
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    if (result.finalResult) {
      _recognizedText += "${result.recognizedWords} ";
      notifyListeners();
      log("user voice: $_recognizedText");
    }
  }
}
