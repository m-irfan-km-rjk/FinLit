enum AttachmentType { none, video, audio, image }

class Question {
  final String qtext;
  final String qtype;
  final List<String> qchoices;
  final int correctIndex;
  final String? qattachment;
  final AttachmentType qattachmenttype;
  final String ttsLine;

  Question({
    required this.qtext,
    required this.qtype,
    required this.qchoices,
    required this.correctIndex,
    this.qattachment,
    this.qattachmenttype = AttachmentType.none,
    required this.ttsLine,
  });
}
