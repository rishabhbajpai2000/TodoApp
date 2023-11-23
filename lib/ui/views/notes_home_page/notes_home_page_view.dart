import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'notes_home_page_viewmodel.dart';
import 'notes_home_page_view.form.dart';

@FormView(
  fields: [
    FormTextField(name: 'NewNote'),
  ],
)
class NotesHomePageView extends StackedView<NotesHomePageViewModel>
    with $NotesHomePageView {
  const NotesHomePageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotesHomePageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(children: [
          Expanded(
            child: StreamBuilder(
              stream: viewModel.todoStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: Text("${index + 1}."),
                            trailing: GestureDetector(
                                onTap: () {
                                  print(snapshot.data[index]['id']);
                                  viewModel.deleteNote(
                                      snapshot.data[index]['id'].toString());
                                },
                                child: Icon(Icons.delete)),
                            title: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                        "${snapshot.data[index]['text']}")),
                                GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return new AlertDialog(
                                              title: new Text("Edit the note"),
                                              content: new TextFormField(
                                                initialValue: snapshot
                                                    .data[index]['text'],
                                                onChanged: (value) {
                                                  viewModel.newNoteValue =
                                                      value;
                                                  viewModel.updateNote(snapshot
                                                      .data[index]['id']
                                                      .toString());
                                                },
                                              ),
                                            );
                                          });
                                    },
                                    child: Icon(Icons.update,
                                        color: Colors.blue, size: 20.0)),
                              ],
                            ));
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 230.0,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter note',
                  ),
                  controller: newNoteController,
                ),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: () {
                  viewModel.createNote();
                },
                child: const Text('Create'),
              ),
              const SizedBox(width: 10.0),
              GestureDetector(
                onTap: () => viewModel.logout(),
                child: Icon(Icons.logout, color: Colors.red, size: 30.0)),
            ],
          )
        ]),
      ),
    );
  }

  @override
  void onViewModelReady(NotesHomePageViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  NotesHomePageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotesHomePageViewModel();
}
