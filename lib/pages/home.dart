import 'package:flutter/material.dart';
import 'package:group10_project_khawaja_deepak/models/api_service.dart';
import 'package:group10_project_khawaja_deepak/models/patient_model.dart';
import 'package:group10_project_khawaja_deepak/util/patient_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Hello, ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Nurse',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  // profile pic
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    // child: Icon(Icons.person),
                    child: Image.asset(
                      'lib/assets/images/nurse.png',
                      height: 60,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[200],
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
            const SizedBox(height: 30),
            // Paitent lists
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Patients List',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[10],
                    ),
                  ),
                  Text(
                    'All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
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
                          return PatientCard(
                            patientId: items[index].id!,
                            patientName: items[index].fullName!,
                            age: items[index].age!,
                            gender: items[index].gender!,
                            dateOfBirth: items[index].dateOfBirth!,
                            phoneNumber: items[index].phoneNumber!,
                            address: items[index].address!,
                            doctor: items[index].doctor!,
                            department: items[index].department!,
                          );
                        },
                        // ],
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
