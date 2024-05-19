import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VerficationCodeController extends GetxController {
  final TextEditingController verificationCodeController = TextEditingController();
  late Timer _timer;
  int remainingTimeInSeconds = 60; // 90 minutes in seconds

  String formatTime(Duration duration) {
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  Duration calculateRemainingTime() {
    return Duration(seconds: remainingTimeInSeconds);
  }
  void resendCode() {

      remainingTimeInSeconds = 60;
      startTimer();
      update();

  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (remainingTimeInSeconds <= 0) {
        _timer.cancel();
      } else {
        remainingTimeInSeconds--;
      }
      update(); // Update UI with new remaining time
    });
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    super.onClose();
    _timer.cancel(); // Cancel timer when controller is closed to prevent memory leaks
  }

  Future<String?> fetchVerificationCode() async {
    final url = Uri.parse('https://home-finder-back-end-i7ca.onrender.com/api/v1/auth/verification/65ef8459c2bd7a5646b05034');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data['verificationCode'];
      }
    } catch (e) {
      print('Error fetching verification code: $e');
      return null;
    }
  }

  Future<void> resendVerificationCode() async {
    final url = Uri.parse('https://home-finder-back-end-i7ca.onrender.com/api/v1/auth/resend-code/65ef8459c2bd7a5646b05034');
    try {
      final response = await http.post(url, body: {'userId': 'your_user_id_here'});
      if (response.statusCode == 200) {
        print('Verification code resent successfully.');
        // Reset remaining time when code is resent
        remainingTimeInSeconds = 5400;
        // Restart timer
        startTimer();
      }
    } catch (e) {
      print('Error resending verification code: $e');
    }
  }
}
