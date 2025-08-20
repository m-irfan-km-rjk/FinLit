import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SettingsController extends GetxController {
  // === Appearance ===
  var isDarkTheme = false.obs; // theme toggle
  var fontSize = 16.0.obs; // font size
  var animationsEnabled = true.obs; // animations toggle

  // === Accessibility ===
  var narratorEnabled = false.obs; // narrator toggle
  var speechRate = 1.0.obs; // 0.5x, 1x, 1.5x etc.

  // === Sound ===
  var musicVolume = 0.5.obs; // 0.0 - 1.0
  var soundEffectVolume = 0.7.obs;
  var narratorVolume = 0.9.obs;

  // === Methods ===
  void toggleTheme() => isDarkTheme.value = !isDarkTheme.value;

  void toggleAnimations() => animationsEnabled.value = !animationsEnabled.value;

  void toggleNarrator() => narratorEnabled.value = !narratorEnabled.value;

  void increaseFontSize() {
    if (fontSize.value < 30) fontSize.value += 2;
  }

  void decreaseFontSize() {
    if (fontSize.value > 10) fontSize.value -= 2;
  }

  void setSpeechRate(double rate) => speechRate.value = rate;

  void setMusicVolume(double value) => musicVolume.value = value;

  void setSoundEffectVolume(double value) => soundEffectVolume.value = value;

  void setNarratorVolume(double value) => narratorVolume.value = value;
}