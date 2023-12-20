import 'dart:convert';

import 'package:eventement_mobile/cache/cacheHelper.dart';
import 'package:eventement_mobile/constant/AppConstatnt.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController lieuController = new TextEditingController();
  final TextEditingController maxParticipantController =
      new TextEditingController();
  final TextEditingController RegleController = new TextEditingController();
  TextEditingController dateInput = TextEditingController();
  DateTime selectedDateTime = DateTime.now();
  final DateFormat _dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS");
  final String? token = CacheData.getData(key: 'token');
  void addEvent() async {
    try {
      var reqBody = {
        "name": nameController.text,
        "lieu": lieuController.text,
        "dateDebut": dateInput.text,
        "maxParticipant":
            int.parse(maxParticipantController.text), // Convert to int
        "regle": RegleController.text,
        "userId": "830590E3-55CD-4B1A-C81A-08DBE39A79D7",
        "typeEvnId": selectedValue
      };

      final http.Response response = await http.post(
        Uri.parse(
            AppConstant.url + 'EventContoller/Save'), // Update this endpoint
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(reqBody),
      );

      if (response.statusCode == 200) {
        // Request was successful, handle the response
        print('Event added successfully');
        clearFormFields();
        Navigator.pushNamed(context, "home");
      } else {
        // Request failed, handle the error
        print('Failed to add event, status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handle exceptions, e.g., if maxParticipantController.text is not a valid integer
      print('Error adding event: $e');
    }
  }

  void clearFormFields() {
    nameController.text = '';
    lieuController.text = '';
    maxParticipantController.text = '';
    RegleController.text = '';

    // etc.
  }

  String? selectedValue;
  List<DropdownMenuItem<String>> dropdownItems = [];

  Future<void> type() async {
    try {
      final http.Response res = await http.get(
        Uri.parse(AppConstant.url + 'Type/AllType'),
        headers: {'Content-Type': 'application/json'},
      );

      if (res.statusCode == 200) {
        final List<dynamic> data = json.decode(res.body);

        setState(() {
          dropdownItems = data.map((item) {
            return DropdownMenuItem(
              value: item['id'].toString(),
              child: Text(item['name']),
            );
          }).toList();
        });

        //print(data);
        print(dropdownItems);
      } else {
        print('Failed to load data, status code: ${res.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
    type();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ajouter des événements',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: lieuController,
                decoration: InputDecoration(
                  labelText: "Lieu",
                  prefixIcon: const Icon(Icons.add_location_alt_outlined),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: maxParticipantController,
                decoration: InputDecoration(
                  labelText: "Nombre de participant",
                  prefixIcon: const Icon(Icons.add),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            //Date
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: dateInput,
                // Editing controller of this TextField
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.calendar_today),
                  labelText: "Enter Date and Time",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDateTime = await showDatePicker(
                    context: context,
                    initialDate: selectedDateTime,
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100),
                  );

                  if (pickedDateTime != null) {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(selectedDateTime),
                    );

                    if (pickedTime != null) {
                      setState(() {
                        selectedDateTime = DateTime(
                          pickedDateTime.year,
                          pickedDateTime.month,
                          pickedDateTime.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );

                        dateInput.text = _dateFormat.format(selectedDateTime);
                        print(dateInput.text);
                      });
                    }
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: RegleController,
                minLines: 4,
                maxLines: 8,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: "Entre les regles d'evenement",
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            //TypeEvent =>
            //TypeEvent =>
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 114, 114, 114), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 114, 114, 114), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
                dropdownColor: Colors.grey.shade100,
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue;
                  });
                },
                items: dropdownItems,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'home');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Set the background color to red
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        addEvent();
                        print('$token');
                        print(nameController.text);
                        print(
                          lieuController.text,
                        );
                        print(dateInput.text);
                        print(maxParticipantController.text);
                        print(RegleController.text);
                        print("830590E3-55CD-4B1A-C81A-08DBE39A79D7");
                        print(selectedValue);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Set the background color to red
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
