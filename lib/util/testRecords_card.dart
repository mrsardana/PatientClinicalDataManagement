import 'package:flutter/material.dart';

class TestRecordsHistory extends StatelessWidget {
  final String RecordDate;
  final String RespiratoryRate;
  final String BloodOxygen;
  final String Heartbeat;
  final String BloodPressure;

  const TestRecordsHistory(
      {required this.RecordDate,
      required this.RespiratoryRate,
      required this.BloodOxygen,
      required this.Heartbeat,
      required this.BloodPressure});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // paitent Name
            Text(
              RecordDate,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[1],
                fontSize: 15,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(RespiratoryRate),
                Text(BloodOxygen),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Heartbeat),
                Text(BloodPressure),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
