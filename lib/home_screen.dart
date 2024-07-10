import 'package:flutter/material.dart';
import 'package:student_record/components/add_details.dart';
import 'package:student_record/components/student_tile.dart';
import 'package:student_record/const.dart';
import 'package:student_record/db/model/students_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<StudentData> students = [];

  void addStudent(StudentData student) {
    setState(() {
      students.add(student);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Student Records',
            style: TextStyle(color: whiteColor),
          ),
          actions: const [
            Icon(Icons.search, color: whiteColor),
            SizedBox(width: 20),
            Icon(Icons.grid_view, color: whiteColor),
            SizedBox(width: 10),
          ],
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index) {
              return StudentTile(student: students[index]);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAddStudentDialog(context, addStudent);
          },
         child: Icon(
            Icons.add,
            color: whiteColor,
          ),
          backgroundColor: Colors.teal,
        ),
      ),
    );
  }
}
