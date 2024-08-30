import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  // const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController textController = TextEditingController();
  int wordCount = 0;
  int characterCount = 0;

  int countWords(String text) {
    // Split the text by spaces and remove any empty elements
    List<String> words = text.split(RegExp(r'\s+')).where((word) => word.isNotEmpty).toList();
    return words.length;
  }

  funCountWords(String newVal) {
    if (kDebugMode) {
      print('-- types --');
      print(newVal);
      print(newVal.runtimeType);
    }
    setState(() {
      wordCount = countWords(newVal.toString());
      characterCount = newVal.toString().length;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Scaffold(
      // drawer: const DrawerHeader(
      //   decoration: BoxDecoration(
      //     color: Colors.blue,
      //   ),
      //   child: Text(
      //     'Driver App',
      //     style: TextStyle(color: Colors.white, fontSize: 25),
      //   ),
      // ),
      appBar: AppBar(
        title: Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              TableRow(
                children: <Widget>[
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: const Center(child: Text('Words', style: TextStyle(fontSize: 12.0, color: Colors.grey))),
                    )
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: const Center(child: Text('Characters', style: TextStyle(fontSize: 12.0, color: Colors.grey))),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: const Center(child: Text('Clear', style: TextStyle(fontSize: 12.0, color: Colors.grey))),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    child: Center(child: Text(wordCount.toString(), style: const TextStyle(fontSize: 14.0, color: Colors.black87, fontWeight: FontWeight.bold))),
                  ),
                  TableCell(
                    child: Center(child: Text(characterCount.toString(), style: const TextStyle(fontSize: 14.0, color: Colors.black87, fontWeight: FontWeight.bold))),
                  ),
                  TableCell(
                    child: Center(child:
                      IconButton(
                        onPressed: (){
                          setState(() {
                            textController.value = const TextEditingValue(text: '');
                          });
                        },
                        icon: const Icon(Icons.close),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      ),
                    ),
                  ),
                ],
              ),
            ],
        ),
      ),
      body: TextField(
        onChanged: (String? newVal) {
          funCountWords(newVal.toString());
        },
        controller: textController,
        decoration: const InputDecoration(
          hintText: 'Type something, or paste here',
          // border: InputBorder.none,
          // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black87, width: 0.5)),
          contentPadding: EdgeInsets.only(left: 12, right: 12),
        ),
        minLines: 40,
        maxLines: null,
      ),
    );
  }
}
