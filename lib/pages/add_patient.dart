import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group10_project_khawaja_deepak/models/api_service.dart';
import 'package:intl/intl.dart';
import 'package:age/age.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController dateOfBirth = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController doctor = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fullName.dispose();
    dateOfBirth.dispose();
    age.dispose();
    phoneNumber.dispose();
    address.dispose();
    doctor.dispose();
    super.dispose();
  }

  late String dropdownValue = 'Choose Department';
  late String dropdownError = "";
  late String selectedRadio;
  // late AgeDuration age;
  late int age1;
  bool _validateName = false;
  bool _validateDateOfBirth = false;
  bool _validatePhoneNumber = false;
  bool _validateAddress = false;
  bool _validateDoctor = false;
  bool _validateDepartment = false;

  @override
  void initState() {
    super.initState();
    selectedRadio = "Male";
  }

  setSelectedRadio(String val) {
    setState(() {
      selectedRadio = val;
    });
  }

  void addButtonPressed() {
    setState(() {
      fullName.text.isEmpty ? _validateName = true : _validateName = false;

      dateOfBirth.text.isEmpty
          ? _validateDateOfBirth = true
          : _validateDateOfBirth = false;

      phoneNumber.text.isEmpty || !(phoneNumber.text.length == 10)
          ? _validatePhoneNumber = true
          : _validatePhoneNumber = false;

      address.text.isEmpty ? _validateAddress = true : _validateAddress = false;

      doctor.text.isEmpty ? _validateDoctor = true : _validateDoctor = false;
    });

    dropdownValue == 'Choose Department'
        ? setState(() {
            dropdownError = "*Department is required";
            _validateDepartment = true;
          })
        : _validateDepartment = false;

    if (!_validateName &&
        !_validateDateOfBirth &&
        !_validateDateOfBirth &&
        !_validatePhoneNumber &&
        !_validateAddress &&
        !_validateDoctor &&
        !_validateDepartment) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
      var data = {
        "fullName": fullName.text,
        "gender": selectedRadio,
        "dateOfBirth": dateOfBirth.text,
        "age": age.text,
        "phoneNumber": phoneNumber.text,
        "address": address.text,
        "doctor": doctor.text,
        "department": dropdownValue
      };
      APIService.addPatient(data);
      print(
          'Patient Added ${fullName.text} $selectedRadio ${dateOfBirth.text} ${age.text} ${phoneNumber.text} ${address.text} ${doctor.text} $dropdownValue');
      fullName.text = "";
      dateOfBirth.text = "";
      age.text = "";
      phoneNumber.text = "";
      address.text = "";
      doctor.text = "";
      dropdownValue = 'Choose Department';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // App bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Add Patient',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              // Name
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
                    controller: fullName,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Full Name',
                      errorText: _validateName ? '*Name is required' : null,
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Gender
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Gender",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                          const Text("       "),
                          Radio(
                            value: "Male",
                            groupValue: selectedRadio,
                            activeColor: Colors.deepPurple,
                            onChanged: (val) {
                              setSelectedRadio(val!);
                            },
                          ),
                          const Text("          "),
                          Radio(
                            value: "Female",
                            groupValue: selectedRadio,
                            activeColor: Colors.deepPurple,
                            onChanged: (val) {
                              setSelectedRadio(val!);
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text("                         "),
                          Text(
                            "Male",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("              "),
                          Text(
                            "Female",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // DOB
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      // Text("DOB  "),
                      Expanded(
                        child: TextField(
                          controller: dateOfBirth,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Date of Birth",
                            errorText: _validateDateOfBirth
                                ? '*Date of birth is required'
                                : null,
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1920),
                                lastDate: DateTime.now());
                            if (pickedDate != null) {
                              setState(() {
                                dateOfBirth.text = DateFormat('dd-MMM-yyyy')
                                    .format(pickedDate);

                                // calculation age on base of DOB
                                DateTime today = DateTime.now();
                                // age = Age.dateDifference(
                                //     fromDate: pickedDate,
                                //     toDate: today,
                                //     includeToDate: false);
                                age1 = today.year - pickedDate.year;
                                int month1 = today.month;

                                int month2 = pickedDate.month;
                                if (month2 > month1) {
                                  age1--;
                                } else if (month1 == month2) {
                                  int day1 = today.day;
                                  int day2 = pickedDate.day;
                                  if (day2 > day1) {
                                    age1--;
                                  }
                                }
                                age.text = age1.toString();
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Age
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          enabled: false,
                          controller: age,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Age",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Contact
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: phoneNumber,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ], // Only n
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Contact",
                            hintStyle: const TextStyle(color: Colors.black),
                            errorText: _validatePhoneNumber
                                ? '*Contact must be 10 digits'
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Address
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: address,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Address",
                            hintStyle: const TextStyle(color: Colors.black),
                            errorText: _validateAddress
                                ? '*Address is required'
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Doctor assigned
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: doctor,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Assign Doctor",
                            hintStyle: const TextStyle(color: Colors.black),
                            errorText: _validateDoctor
                                ? '*Assign doctor is required'
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Department
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          isExpanded: true,
                          elevation: 16,
                          hint: Text("Select option", maxLines: 1),
                          items: <String>[
                            'Choose Department',
                            'General',
                            'Emergency'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                              dropdownError = "";
                            });
                          },
                        ),
                      ),
                      dropdownError == ""
                          ? SizedBox.shrink()
                          : Text(
                              dropdownError,
                              style: TextStyle(color: Colors.red),
                            )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: addButtonPressed,
                    // calculate,
                    child: const Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
