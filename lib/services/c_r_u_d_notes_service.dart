import 'package:supabase_flutter/supabase_flutter.dart';

import 'Note.dart';

// password for the project on supabase is. k5dDooGGz5yiRdPZ
class CRUDNotesService {
  final _todoStream =
      Supabase.instance.client.from('Todos').stream(primaryKey: ["id"]);

  Future<void> create(String text) async {
    Note _note = Note(
      text: text,
    );
    await Supabase.instance.client.from('Todos').insert(
      {
        'id': _note.id,
        'text': text,
      },
    );
  }

  Stream get todoStream => _todoStream;

  void update(String id, String text) async {
    await Supabase.instance.client
        .from('Todos')
        .update({'text': text}).match({'id': id});
    print("Note updated sucessfully");
  }

  void delete(String id) async {
    await Supabase.instance.client.from('Todos').delete().match({'id': id});
    print("Note deleted sucessfully");
  }
}
