import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PatientInfoView extends StatefulWidget {
  const PatientInfoView({super.key, required this.userDetails});
  final Map userDetails;

  @override
  State<PatientInfoView> createState() => _PatientInfoViewState();
}

class _PatientInfoViewState extends State<PatientInfoView> {
  final TextEditingController _patientnameController = TextEditingController();
  final TextEditingController _fathernameController = TextEditingController();
  final TextEditingController _mothernameController = TextEditingController();
  final TextEditingController _emailidController = TextEditingController();
  final TextEditingController _mobilenumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _apoDateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _datetimeController = TextEditingController();

  String? dropDownValue;
  String? gender;
  String? appomentTime;
  String? doctor;
  final _formKey = GlobalKey<FormState>();
  List state = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "Uttar Pradesh",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Lakshadweep",
    "Puducherry"
  ];

  List times = [
    "9:00:00 to 10:00:00",
    "10:00:00 to 11:00:00",
    "11:00:00 to 12:00:00",
    "12:00:00 to 13:00:00",
    "13:30:00 to 14:30:00",
    "14:30:00 to 15:30:00",
    "15:30:00 to 16:30:00",
    "16:30:00 to 17:30:00",
    "18:00:00 to 19:00:00",
    "19:00:00 to 20:00:00",
  ];

  @override
  void initState() {
    _patientnameController.text = widget.userDetails["name"];
    _emailidController.text = widget.userDetails["email"];
    _mobilenumberController.text = widget.userDetails["mobileNumber"];
    _dobController.text = widget.userDetails["dob"];

    super.initState();
  }

  void _showdatepicker() async {
    var date = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(date.year, date.month, date.day + 4),
    );

    _apoDateController.text = DateFormat('dd-MM-yyyy').format(pickedDate!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appoiment"),
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _patientnameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Patient's name",
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _fathernameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Father's name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Please enter your father\'s name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _mothernameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Mother's name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Please enter your mother\'s name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _dobController,
                  decoration: const InputDecoration(
                    hintText: "D.O.B.",
                    suffixIcon: Icon(Icons.calendar_month_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      "Gender :",
                      style: TextStyle(fontSize: 18),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: Colors.teal,
                        title: const Text("Male"),
                        value: "male",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Female"),
                        value: "Female",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                height: 56.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.teal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Patient\'s Address',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Address"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Please enter your Address';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "city"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Please enter your city';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  menuMaxHeight: 450,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  hint: const Text("State"),
                  value: dropDownValue,
                  items: state
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      dropDownValue = value.toString();
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 56.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.teal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Patient\'s Contact',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _emailidController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Email ID "),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _mobilenumberController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Mobile Number",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 56.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.teal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Appoiment Information',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _apoDateController,
                  readOnly: true,
                  onTap: _showdatepicker,
                  decoration: InputDecoration(
                    hintText: "Date",
                    suffixIcon: IconButton(
                      onPressed: _showdatepicker,
                      icon: const Icon(Icons.calendar_month_outlined),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  // menuMaxHeight: 450,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  hint: const Text("Time"),
                  value: appomentTime,
                  items: times
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      appomentTime = value.toString();
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Perferred Physician",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Dr.Anderson"),
                      value: "Dr.Anderson",
                      groupValue: doctor,
                      onChanged: (value) {
                        setState(() {
                          doctor = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Dr.Jones"),
                      value: "Dr.Jones",
                      groupValue: doctor,
                      onChanged: (value) {
                        setState(() {
                          doctor = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Dr.Patel"),
                      value: "Dr.Patel",
                      groupValue: doctor,
                      onChanged: (value) {
                        setState(() {
                          doctor = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Dr.Smith"),
                      value: "Dr.Smith",
                      groupValue: doctor,
                      onChanged: (value) {
                        setState(() {
                          doctor = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              RadioListTile(
                title: const Text("No perference"),
                value: "No perference",
                groupValue: doctor,
                onChanged: (value) {
                  setState(() {
                    doctor = value;
                  });
                },
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  child: const Text("submit"),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
