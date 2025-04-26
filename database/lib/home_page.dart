import 'package:database/data/local/db_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController deController = TextEditingController();

  List<Map<String, dynamic>> allNotes = [];

  DBHelper? dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = DBHelper.instance;
    getNotes();
  }

  void getNotes() async {
    allNotes = await dbRef!.getAllNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notes"), centerTitle: true),
      body:
          allNotes.isEmpty
              ? const Center(child: Text("No notes available"))
              : ListView.builder(
                itemCount: allNotes.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: Text(allNotes[index][DBHelper.COLUMN_NOTE_SNO]),
                    title: Text(allNotes[index][DBHelper.COLUMN_NOTE_TITLE]),
                    subtitle: Text(allNotes[index][DBHelper.COLUMN_NOTE_DESC]),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Note to be added here
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(11),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "Add Note",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 21),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "Enter title here",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                    SizedBox(height: 21),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "Enter Description here",
                        label: Text("Description"),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                    SizedBox(height: 21),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                              ),
                              side: BorderSide(width: 4, color: Colors.red),
                            ),
                            onPressed: () async {
                              var title = titleController.text;
                              var desc = titleController.text;

                              if (title.isEmpty && desc.isEmpty) {
                                bool check = await dbRef!.addNote(
                                  mTitle: title,
                                  mDesc: desc,
                                );
                                if (check) {
                                  getNotes();
                                }
                              }
                              Navigator.pop(context);
                            },
                            child: Text("Add Note"),
                          ),
                        ),
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                              ),
                              side: BorderSide(width: 4, color: Colors.red),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
