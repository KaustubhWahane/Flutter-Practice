import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_map_provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('List Page')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: 'Enter item title'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                Provider.of<ListMapProvider>(
                  context,
                  listen: false,
                ).addItem(controller.text);
                controller.clear();
              }
            },
            child: const Text('Add Item'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Consumer<ListMapProvider>(
              builder: (context, listProvider, child) {
                return ListView.builder(
                  itemCount: listProvider.items.length,
                  itemBuilder: (context, index) {
                    final item = listProvider.items[index];
                    TextEditingController updateController =
                        TextEditingController(text: item['title']);
                    return ListTile(
                      title: Text(item['title']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Update Item'),
                                    content: TextField(
                                      controller: updateController,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter new title',
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          if (updateController
                                              .text
                                              .isNotEmpty) {
                                            listProvider.updateItem(
                                              item['id'],
                                              updateController.text,
                                            );
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: const Text('Update'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              listProvider.removeItem(item['id']);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
