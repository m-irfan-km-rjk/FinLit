import 'package:finlit/components/misc/question.dart';

List<Question> quizQuestions = [
  // Text-based questions
  Question(
    qtext: "You have ₹100. You buy a notebook for ₹35 and a pen for ₹15. How much money will you have left?",
    qtype: "text",
    qchoices: ["₹40", "₹50"],
    correctIndex: 1, // ₹50 is correct (100 - 35 - 15 = 50)
    ttsLine: "You have one hundred rupees. You buy a notebook for thirty five rupees and a pen for fifteen rupees. How much money will you have left?",
  ),

  Question(
    qtext: "Your friend gave you ₹200 for your birthday. You can either buy a toy for ₹180 or save the money. Which is the better choice to keep more money for later?",
    qtype: "text",
    qchoices: ["Save", "Buy the toy"],
    correctIndex: 0, // "Save" is the better choice to keep more money
    ttsLine: "Your friend gave you two hundred rupees for your birthday. You can either buy a toy for one hundred eighty rupees or save the money. Which is the better choice to keep more money for later?",
  ),

  Question(
    qtext: "You have ₹150. You need a school bag for ₹140 and also want a cap for ₹80. Can you buy both?",
    qtype: "text",
    qchoices: ["Yes", "No"],
    correctIndex: 1, // "No" is correct (140 + 80 = 220 > 150)
    ttsLine: "You have one hundred fifty rupees. You need a school bag for one hundred forty rupees and also want a cap for eighty rupees. Can you buy both?",
  ),

  // Image-based questions
  Question(
    qtext: "Which one is worth more?",
    qtype: "image",
    qchoices: ["₹200 note", "₹50 note"],
    correctIndex: 0, // ₹50 note is worth more
    qattachment: "images/currency_notes_comparison.png",
    qattachmenttype: AttachmentType.image,
    ttsLine: "Look at the image showing different currency notes. Which one is worth more?",
  ),

  Question(
    qtext: "You have ₹70. Can you buy water bottle and chips together?",
    qtype: "image",
    qchoices: ["Yes", "No"],
    correctIndex: 0, // "Yes" - water bottle ₹40 + chips ₹30 = ₹70
    qattachment: "images/items_with_prices.png",
    qattachmenttype: AttachmentType.image,
    ttsLine: "Look at the image showing items with their prices. You have seventy rupees. Can you buy water bottle and chips together?",
  ),

  // Video-based questions
  Question(
    qtext: "What is this machine called?",
    qtype: "video",
    qchoices: ["ATM",  "Printer"],
    correctIndex: 0, // "ATM" is correct
    qattachment: "videos/atm_withdrawal.mp4",
    qattachmenttype: AttachmentType.video,
    ttsLine: "Watch the video showing someone using a machine. What is this machine called?",
  ),

  Question(
    qtext: "If your bill is ₹480 and you have ₹500, will you get any money back?",
    qtype: "video",
    qchoices: ["Yes", "No"],
    correctIndex: 0, // "Yes" - you'll get ₹20 back (500 - 480 = 20)
    qattachment: "videos/online_checkout.mp4",
    qattachmenttype: AttachmentType.video,
    ttsLine: "Watch the video showing online shopping checkout. If your bill is four hundred eighty rupees and you have five hundred rupees, will you get any money back?",
  ),

  // Audio-based questions
  Question(
    qtext: "What machine makes this sound?",
    qtype: "audio",
    qchoices: ["ATM", "Printer"],
    correctIndex: 0, // "ATM" is correct (cash dispensing sound)
    qattachment: "audio/atm_cash_dispensing.mp3",
    qattachmenttype: AttachmentType.audio,
    ttsLine: "Listen to the sound carefully. What machine makes this sound?",
  ),

  Question(
    qtext: "Is this sound made by coins or paper notes?",
    qtype: "audio",
    qchoices: ["Coins", "Paper notes"],
    correctIndex: 0, // "Coins" is correct (coins dropping sound)
    qattachment: "audio/coins_dropping.mp3",
    qattachmenttype: AttachmentType.audio,
    ttsLine: "Listen to the sound carefully. Is this sound made by coins or paper notes?",
  ),

  // Scenario-based (Text + Image)
  Question(
    qtext: "You have ₹200 in your wallet. After recharge, how much will remain?",
    qtype: "scenario",
    qchoices: ["₹51", "₹49"],
    correctIndex: 0, // "₹51" is correct (200 - 149 = 51)
    qattachment: "images/mobile_recharge_149.png",
    qattachmenttype: AttachmentType.image,
    ttsLine: "Look at the mobile recharge screen showing one hundred forty nine rupees recharge plan. You have two hundred rupees in your wallet. After recharge, how much will remain?",
  ),
];