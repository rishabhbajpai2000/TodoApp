class Note {
  String text;
  late String id;
  late DateTime dateTime;

  Note({
    required this.text,
  }) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
    dateTime = DateTime.now();
    print('Note created: $id, $dateTime, $text');
  }
}
