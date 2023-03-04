import 'package:flutter/material.dart';
import 'package:group10_project_khawaja_deepak/util/testRecords_card.dart';

class AddTestRecord extends StatefulWidget {
  final String patientId;
  final String patientName;
  AddTestRecord(
      {super.key, required this.patientId, required this.patientName});

  @override
  State<AddTestRecord> createState() => _AddTestRecordState();
}

class _AddTestRecordState extends State<AddTestRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            // App bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.patientName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  // controller: fullName,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Respiratory Rate (X/min)',
                    // errorText: _validateName ? '*Name is required' : null,
                    labelStyle: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  // controller: fullName,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Blood Oxygen Level (X%)',
                    // errorText: _validateName ? '*Name is required' : null,
                    labelStyle: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  // controller: fullName,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Heartbeat Rate (X/min)',
                    // errorText: _validateName ? '*Name is required' : null,
                    labelStyle: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  // controller: fullName,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Blood Pressure (X/Y mmHg)',
                    // errorText: _validateName ? '*Name is required' : null,
                    labelStyle: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: null,
                  // calculate,
                  child: const Text(
                    'Add Test',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.patientName + ': History Records',
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      // List View for test records
                      TestRecordsHistory(
                          RecordDate: "01 Jan 2022 10:45",
                          RespiratoryRate: "RespiratoryRate",
                          BloodOxygen: "BloodOxygen",
                          Heartbeat: "Heartbeat",
                          BloodPressure: "BloodPressure"),
                      TestRecordsHistory(
                          RecordDate: "20 Mar 2022 12:23",
                          RespiratoryRate: "RespiratoryRate",
                          BloodOxygen: "BloodOxygen",
                          Heartbeat: "Heartbeat",
                          BloodPressure: "BloodPressure"),
                      TestRecordsHistory(
                          RecordDate: "15 Jan 2023 01:03",
                          RespiratoryRate: "RespiratoryRate",
                          BloodOxygen: "BloodOxygen",
                          Heartbeat: "Heartbeat",
                          BloodPressure: "BloodPressure"),
                      TestRecordsHistory(
                          RecordDate: "08 Feb 2023 22:03",
                          RespiratoryRate: "RespiratoryRate",
                          BloodOxygen: "BloodOxygen",
                          Heartbeat: "Heartbeat",
                          BloodPressure: "BloodPressure"),
                      TestRecordsHistory(
                          RecordDate: "16 Feb 2023 22:03",
                          RespiratoryRate: "12",
                          BloodOxygen: "BloodOxygen",
                          Heartbeat: "Heartbeat",
                          BloodPressure: "BloodPressure"),
                    ],
                  ),
                ),
              ),
            )
            // To Update
          ],
        ),
      ),
    );
  }
}
