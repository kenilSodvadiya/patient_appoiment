import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_appoiment/patient_info_view.dart';

class SignupPageView extends StatefulWidget {
  const SignupPageView({super.key});

  @override
  State<SignupPageView> createState() => _SignupPageViewState();
}

class _SignupPageViewState extends State<SignupPageView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  bool passwordLength = false;
  bool passwordUppercase = false;
  bool passwordDigit = false;
  bool isVisible = false;
  bool isVisible2 = false;
  void _showdatepicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    _dobController.text = DateFormat('dd-MM-yyyy').format(pickedDate!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _fromKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter a name";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _dobController,
                    keyboardType: TextInputType.none,
                    onTap: _showdatepicker,
                    decoration: InputDecoration(
                      hintText: "D.O.B.",
                      suffixIcon: IconButton(
                        onPressed: _showdatepicker,
                        icon: const Icon(Icons.calendar_month_outlined),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Mobile Number",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter a Mobile Number";
                      } else if (value.length != 10) {
                        return "Enter valid Mobile Number";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: mobileNumberController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email",
                    ),
                    validator: (value) {
                      final bool emailValid = RegExp(
                              r"^[a-z0-9.a-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-z0-9]+\.[a-z]+")
                          .hasMatch(value ?? '');
                      if (value == null || value.isEmpty) {
                        return "Please Enter a email address";
                      } else if (!emailValid) {
                        return "Enter a valid email address";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: isVisible
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off))),
                    validator: (value) {
                      bool hasCapital = RegExp(r"[A-Z]").hasMatch(value ?? '');
                      bool hasSmall = RegExp(r"[a-z]").hasMatch(value ?? '');
                      bool hasNamber = RegExp(r"[0-9]").hasMatch(value ?? '');
                      if (value == null || value.isEmpty) {
                        return "Please enter a Storng password";
                      } else if (!hasCapital) {
                        return "contain at least one upper case";
                      } else if (!hasNamber) {
                        return "contain at least one digit";
                      } else if (!hasSmall) {
                        return "contain at least one lower case";
                      } else if (value.length < 8) {
                        return "Must be at least 8 characters in length";
                      }

                      return null;
                    },
                    onChanged: (value) {
                      if (value.length >= 8) {
                        setState(() {
                          passwordLength = true;
                        });
                      }
                      if (value.length < 8) {
                        setState(() {
                          passwordLength = false;
                        });
                      }
                      bool hasCapital = RegExp(r"[A-Z]").hasMatch(value);
                      bool hasSmall = RegExp(r"[a-z]").hasMatch(value);
                      bool hasNamber = RegExp(r"[0-9]").hasMatch(value);
                      if (hasCapital == true) {
                        setState(() {
                          passwordUppercase = true;
                        });
                      }
                      if (hasCapital == false) {
                        setState(() {
                          passwordUppercase = false;
                        });
                      }
                      if (hasNamber == true) {
                        setState(() {
                          passwordDigit = true;
                        });
                      }
                      if (hasNamber == false) {
                        setState(() {
                          passwordDigit = false;
                        });
                      }
                    },
                    obscureText: isVisible,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomAnimatedContainer(
                    passwordtype: passwordLength,
                    tital: "At least 8 characters",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomAnimatedContainer(
                    passwordtype: passwordUppercase,
                    tital: "At least one upper case",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomAnimatedContainer(
                      tital: "At least one digit", passwordtype: passwordDigit),
                  const SizedBox(
                    height: 11,
                  ),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: isVisible2,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Password";
                      } else if (value != passwordController.text) {
                        return "Something went wrong";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible2 = !isVisible2;
                          });
                        },
                        icon: isVisible2
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton.icon(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    onPressed: () {
                      final checkCurrent = _fromKey.currentState!.validate();
                      // if (checkCurrent) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientInfoView(userDetails: {
                            "name": nameController.text,
                            "mobileNumber": mobileNumberController.text,
                            "email": emailController.text,
                            "dob": _dobController.text,
                          }),
                        ),
                      ).then((value) => _fromKey.currentState?.reset());
                      // }
                    },
                    icon: const Icon(Icons.keyboard_arrow_right),
                    label: const Text("Sign Up"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAnimatedContainer extends StatelessWidget {
  const CustomAnimatedContainer({
    Key? key,
    required this.tital,
    required this.passwordtype,
  }) : super(key: key);

  final bool passwordtype;
  final String tital;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 2),
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
              color: passwordtype ? Colors.teal.shade300 : Colors.white),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(tital)
      ],
    );
  }
}
