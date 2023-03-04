import 'package:flutter/material.dart';
import '../pages/ViewPatient.dart';

class PatientCard extends StatelessWidget {
  final String patientId;
  final String patientName;
  final String gender;
  final String age;

  final String dateOfBirth;
  final String phoneNumber;
  final String address;
  final String doctor;
  final String department;

  PatientCard({
    required this.patientId,
    required this.patientName,
    required this.gender,
    required this.age,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.address,
    required this.doctor,
    required this.department,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: GestureDetector(
        onTap: () {
          //todo
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewPatient(
                      patientId: patientId,
                      patientName: patientName,
                      gender: gender,
                      age: age,
                      dateOfBirth: dateOfBirth,
                      phoneNumber: phoneNumber,
                      address: address,
                      doctor: doctor,
                      department: department,
                    )),
          );
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.deepPurple[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // pic
              Image.asset(
                'lib/assets/images/patient.png',
                height: 70,
              ),
              const SizedBox(
                height: 10,
              ),
              // paitent Name
              Text(
                patientName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[1],
                  fontSize: 17,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(age),
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
