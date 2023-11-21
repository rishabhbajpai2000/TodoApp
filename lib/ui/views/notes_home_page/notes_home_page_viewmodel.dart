import 'package:stacked/stacked.dart';
import 'package:todo_app/services/c_r_u_d_notes_service.dart';
import 'package:todo_app/ui/views/notes_home_page/notes_home_page_view.form.dart';

import '../../../services/Note.dart';

class NotesHomePageViewModel extends FormViewModel {
  final CRUDNotesService _crudNotesService = CRUDNotesService();

  createNote() {
    _crudNotesService.create(newNoteValue!);
    newNoteValue = '';
    rebuildUi();
  }

  deleteNote(String id) {
    _crudNotesService.delete(id);
    rebuildUi();
  }

  updateNote(String id) {
    _crudNotesService.update(id, newNoteValue!);
    rebuildUi();
  }

  Stream get todoStream => _crudNotesService.todoStream;
}
