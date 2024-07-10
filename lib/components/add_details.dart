import 'package:flutter/material.dart';
import 'package:student_record/const.dart';
import 'package:student_record/db/model/students_data.dart';

void showAddStudentDialog(BuildContext context, Function addStudentCallback) {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final placeController = TextEditingController();
  final admissionNoController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      final screenSize =MediaQuery.of(context).size;
      return AlertDialog(
        backgroundColor: Colors.teal,
        title: const Text(
          'ADD STUDENT',
          style: TextStyle(color: whiteColor),
        ),
        content:SingleChildScrollView(   
          child: Container(
          
            width: screenSize.width * 0.7,  
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 50, 
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        "lib/images/add.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  sizedboxh10,
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      enabledBorder: customBorder,
                      filled: true,
                      fillColor: whiteColor,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Name';
                      }
                      return null;
                    },
                  ),
                  sizedboxh10,
                  TextFormField(
                    controller: ageController,
                    decoration: InputDecoration(
                      labelText: 'Age',
                      enabledBorder: customBorder,
                      filled: true,
                      fillColor: whiteColor,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Age';
                      }
                      return null;
                    },
                  ),
              sizedboxh10,
                  TextFormField(
                    controller: placeController,
                    decoration: InputDecoration(
                      labelText: 'Place',
                      enabledBorder: customBorder,
                      filled: true,
                      fillColor: whiteColor,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Place';
                      }
                      return null;
                    },
                  ),
                 sizedboxh10,
                  TextFormField(
                    controller: admissionNoController,
                    decoration: InputDecoration(
                      labelText: 'Admission Number',
                      enabledBorder: customBorder,
                      filled: true,
                      fillColor: whiteColor,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Admission Number';
                      }
                      return null;
                    },
                  ),
                 sizedboxh10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            StudentData student = StudentData(
                              name: nameController.text,
                              age: ageController.text,
                              place: placeController.text,
                              admisstionNo: admissionNoController.text,
                            );
                            addStudentCallback(student);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Save'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
