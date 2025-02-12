import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

///This class is responsible for speech to text conversion.
class SpeechController extends ChangeNotifier {
  final SpeechToText _speech = SpeechToText();
  String _recognizedText = '';
  bool _isListening = false;

  String get recognizedText => _recognizedText;
  bool get isListening => _isListening;

  Future<void> initializeSpeech() async {
    await _speech.initialize(
      onError: (error) => log("Speech Error: ${error.errorMsg}"),
      onStatus: (status) => log("Speech Status: $status"),
    );
  }

  void startListening() {
    _speech.listen(
      localeId: 'ar-SA',
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

  void _onSpeechResult(SpeechRecognitionResult result) {
    if (result.finalResult) {
      _recognizedText += "${result.recognizedWords} ";
      notifyListeners();
      log("user voice: $_recognizedText");
    }
  }
}
