enum AttachmentType {
  none,
  video,
  audio,
  image
}

class Question {
  final String qtext;
  final String qtype;
  final List<String> qchoices;
  final String? qattachment;
  final AttachmentType qattachmenttype;
  final String ttsLine;

  Question({
    required this.qtext,
    required this.qtype,
    required this.qchoices,
    this.qattachment,
    this.qattachmenttype = AttachmentType.none,
    required this.ttsLine,
  });
}