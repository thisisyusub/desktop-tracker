// import 'package:attendance_test/todo.dart';
// import 'package:flutter/material.dart';

// class DriftTest extends StatefulWidget {
//   const DriftTest({super.key});

//   @override
//   State<DriftTest> createState() => _DriftTestState();
// }

// class _DriftTestState extends State<DriftTest> {
//   final _db = MyDatabase();
//   final List<Logs> _todos = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: _writeToDb,
//                   child: const Text('Write'),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton(
//                   onPressed: _readFromDb,
//                   child: const Text('Read'),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemBuilder: (context, index) {
//                   final todo = _todos[index];

//                   return ListTile(
//                     title: Text(todo.title),
//                     subtitle: Text(todo.content),
//                   );
//                 },
//                 itemCount: _todos.length,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _writeToDb() async {
//     await _db.into(_db.todos).insert(
//           TodosCompanion.insert(
//             title: 'Todo 1',
//             content: 'Content 1',
//           ),
//         );

//     await _db.into(_db.todos).insert(
//           LogsCompanion.insert(
//             title: 'Todo 2',
//             content: 'Content 2',
//           ),
//         );

//     await _db.into(_db.todos).insert(
//           LogsCompanion.insert(
//             title: 'Todo 3',
//             content: 'Content 3',
//           ),
//         );
//   }

//   Future<void> _readFromDb() async {
//     final allTodos = await _db.select(_db.todos).get();
//     _todos.clear();

//     setState(() {
//       _todos.addAll(allTodos);
//     });
//   }

//   @override
//   void dispose() {
//     _db.close();
//     super.dispose();
//   }
// }
