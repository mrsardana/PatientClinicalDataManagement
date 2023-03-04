import 'package:flutter/material.dart';
import 'package:group10_project_khawaja_deepak/util/testPatients_card.dart';
import '../models/api_service.dart';
import '../models/patient_model.dart';

class TestRecords extends StatefulWidget {
  const TestRecords({super.key});

  @override
  State<TestRecords> createState() => _TestRecordsState();
}

class _TestRecordsState extends State<TestRecords> {
  TextEditingController editingController = TextEditingController();
  late List<Patient> pdata;
  var items = [];
  late Future fetchData;
  @override
  void initState() {
    fetchData = APIService.getPatient();
    APIService.getPatient().then((data) {
      if (data != null) {
        pdata = data;
        items.addAll(pdata);
      }
    });
    super.initState();
  }

// function for filter search
  void filterSearchResults(String query) {
    List<Patient> dummySearchList = [];
    dummySearchList.addAll(pdata);
    if (query.isNotEmpty) {
      List<Patient> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.fullName!.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(pdata);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            // App bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Add Test Record',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  controller: editingController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: 'Search Patient ',
                  ),
                ),
              ),
            ),

            // List view

            const SizedBox(height: 25),

            FutureBuilder(
                future: fetchData,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  // print("Insinde builer");
                  if (!snapshot.hasData) {
                    // print("if");
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    pdata = snapshot.data;
                    // print(pdata[0].fullName);
                    return Expanded(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          // children: [
                          return TestPatientCard(
                            patientId: items[index].id!,
                            patientName: items[index].fullName!,
                            dateOfBirth: items[index].dateOfBirth!,
                            gender: items[index].gender!,
                          );
                        },
                        // ],
                      ),
                    );
                  }
                })
            // To Update
          ],
        ),
      ),
    );
  }
}
