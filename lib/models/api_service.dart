import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:group10_project_khawaja_deepak/models/patient_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();
  static const baseUrl = "http://127.0.0.1:5000/";

// Post methond to add patients
  static addPatient(Map pdata) async {
    var url = Uri.parse("${baseUrl}patients");
    try {
      final res = await http.post(url, body: pdata);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        // print(data);
      } else {
        print("Failed to get response");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Get meethond to fetch all patients
  static getPatient() async {
    List<Patient> patients = [];
    var url = Uri.parse("${baseUrl}patients");
    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        // print("data");
        data.forEach((value) => {
              patients.add(Patient(
                id: value['_id'],
                fullName: value['fullName'],
                gender: value['gender'],
                dateOfBirth: value['dateOfBirth'],
                age: value['age'],
                phoneNumber: value['phoneNumber'],
                address: value['address'],
                doctor: value['doctor'],
                department: value['department'],
              )),
            });
        // print("data");
        // print(patients[0]);
        return patients;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
