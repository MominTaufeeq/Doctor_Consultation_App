import 'package:flutter/material.dart';
import 'screens/doctor_list_screen.dart';

void main() {
  runApp(const DoctorConsultationApp());
}

class DoctorConsultationApp extends StatelessWidget {
  const DoctorConsultationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Consultation App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const DoctorListScreen(),
    );
  }
}
