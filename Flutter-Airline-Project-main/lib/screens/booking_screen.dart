import 'dart:convert';

import 'package:aeroplane/screens/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:aeroplane/utils/app_styles.dart';
import 'package:http/http.dart' as http;

class PassengerDetailsForm extends StatefulWidget {
  @override
  _PassengerDetailsFormState createState() => _PassengerDetailsFormState();
}

class _PassengerDetailsFormState extends State<PassengerDetailsForm> {

  TextEditingController name=TextEditingController();
  TextEditingController phoneno=TextEditingController();
  TextEditingController age=TextEditingController();
  String _name = '';
  String _phone = '';
  String _passengerType = 'Adult';
  String _gender = 'Male';
  int _age = 0;

  

  Future<void> insertrecord() async {
    if(name.text !="" || phoneno.text !=""|| age.text !="")
      {
        try{
          String uri="http://127.0.0.1/bookingticket_api/insert_record.php";
          var res = await http.post(Uri.parse(uri), body: {
            "name": name.text,
            "phoneno": phoneno.text,
            "age": age.text,
            "pass": _passengerType,
            "gen": _gender,
          });

          var response=jsonDecode(res.body);
          if(response["success"]=="true")
            {
              print("Record Inserted");
            }
          else
            {
              print("Some issue");
            }

        }
        catch(e)
    {

    }
      }
    else {
      print("Please Fill All Fields");
    }
  }
  
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // Set overall background color
      appBar: AppBar(
        title: Text('Passenger Details',
        style: TextStyle(
                      color: Colors.white, // Set text color to white
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
        backgroundColor: Color(0xD91130CE), // Set app bar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: phoneno,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _phone = value;
                    });
                  },
                ),
                SizedBox(height: 15),
                Text('Passenger Type:'),
                Row(
                  children: [
                    Radio(
                      value: 'Adult',
                      groupValue: _passengerType,
                      onChanged: (value) {
                        setState(() {
                          _passengerType = value.toString();
                        });
                      },
                    ),
                    Text('Adult'),
                    Radio(
                      value: 'Child',
                      groupValue: _passengerType,
                      onChanged: (value) {
                        setState(() {
                          _passengerType = value.toString();
                        });
                      },
                    ),
                    Text('Child'),
                    Radio(
                      value: 'Infant',
                      groupValue: _passengerType,
                      onChanged: (value) {
                        setState(() {
                          _passengerType = value.toString();
                        });
                      },
                    ),
                    Text('Infant'),
                  ],
                ),
                SizedBox(height: 15),
                Text('Gender:'),
                Row(
                  children: [
                    Radio(
                      value: 'Male',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value.toString();
                        });
                      },
                    ),
                    Text('Male'),
                    Radio(
                      value: 'Female',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value.toString();
                        });
                      },
                    ),
                    Text('Female'),
                  ],
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: age,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null) {
                      return 'Please enter a valid age';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _age = int.tryParse(value) ?? 0;
                    });
                  },
                ),
                
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {

                      print('Name: $_name');
                      print('Phone: $_phone');
                      print('Passenger Type: $_passengerType');
                      print('Gender: $_gender');
                      print('Age: $_age');
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage()));

                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xD91130CE),
                    padding: EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
                    // Set button background color
                  ),
                  child: Text(
                    'Book Now',
                    style: TextStyle(
                      color: Colors.white, // Set button text color to white
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PassengerDetailsForm(),
  ));
}
