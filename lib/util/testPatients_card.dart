import 'package:flutter/material.dart';

import '../pages/add_testRecord.dart';

class TestPatientCard extends StatelessWidget {
  final String patientId;
  final String patientName;
  final String gender;
  final String dateOfBirth;

  TestPatientCard(
      {required this.patientId,
      required this.patientName,
      required this.gender,
      required this.dateOfBirth});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: GestureDetector(
        onTap: () {
          //todo
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddTestRecord(
                      patientId: patientId,
                      patientName: patientName,
                    )),
          );
        },
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.deepPurple[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                patientName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[1],
                  fontSize: 17,
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('DOB: $dateOfBirth'),
                  const Text("  "),
                  Text(gender),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
