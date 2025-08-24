import 'package:finlit/components/controllers/question_controller.dart';
import 'package:get/get.dart';
import 'package:usb_serial/usb_serial.dart';
import 'dart:typed_data';

import '../../pages/quiz.dart';

class UsbController extends GetxController {
  UsbPort? _port;

  @override
  void onInit() {
    super.onInit();
    initUsb();
  }

  Future<void> initUsb() async {
    List<UsbDevice> devices = await UsbSerial.listDevices();
    if (devices.isEmpty) {
      print("No USB devices found");
      return;
    }

    UsbDevice device = devices.first;
    _port = await device.create();

    bool openResult = await _port!.open();
    if (!openResult) {
      print("Failed to open port");
      return;
    }

    await _port!.setDTR(true);
    await _port!.setRTS(true);
    await _port!.setPortParameters(
      9600,
      UsbPort.DATABITS_8,
      UsbPort.STOPBITS_1,
      UsbPort.PARITY_NONE,
    );

    // Listen for Arduino messages
    _port!.inputStream?.listen((data) {
      final message = String.fromCharCodes(data).trim();
      print("Received from USB: $message");

      final QuizController quizController = Get.find<QuizController>();

      if (message.startsWith("edu")) {
        final number = int.tryParse(message.replaceFirst("edu", ""));
        if (number != null) {
          quizController.checkAnswer(number - 1); // edu1 -> option 0
        }
      }
    });
  }
}