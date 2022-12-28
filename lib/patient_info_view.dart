import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PatientInfoView extends StatefulWidget {
  const PatientInfoView({super.key});

  @override
  State<PatientInfoView> createState() => _PatientInfoViewState();
}

class _PatientInfoViewState extends State<PatientInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patient Information"),
      ),
    );
  }
}
