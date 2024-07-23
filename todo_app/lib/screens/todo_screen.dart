import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List todos = [];
  TextEditingController txtTitle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App')
        ,),
        body: Column(children: [
          //section to add new task
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: txtTitle,
                    decoration: InputDecoration(
                      hintText: 'Enter title of task',
                    ),
                  ),
                  ),
                
                  IconButton(
                    onPressed: () {
                      if(txtTitle.text.isNotEmpty){
                        todos.add({'id':1,
                        'title':txtTitle.text,
                        'isCompleted':false
                        });
                        txtTitle.clear();
                        setState(() {});
                      }
                    },
                      icon:Icon(Icons.add),
              
                ),
              ],
            ),
            Expanded(
              child:ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) => Card(
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: todos[index]['isCompleted'], 
                      onChanged: (v) {},
                        title: Text('${todos[index]['title']}'),
                           secondary: SizedBox(
                            width: 96,
                             child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {}, 
                                  icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {}, 
                                    icon: Icon(Icons.delete),
                                    )
                              ],
                            )
                          )),
                ),
            ),
             
            ),
        ],
        )
    );
  }
}