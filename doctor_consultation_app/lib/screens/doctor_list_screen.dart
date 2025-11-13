import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/doctor.dart';
import 'book_appointment_screen.dart';

class DoctorListScreen extends StatefulWidget {
  const DoctorListScreen({super.key});

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  late Future<List<Doctor>> doctorsFuture;

  Future<List<Doctor>> loadDoctors() async {
    final String response = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/doctors.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Doctor.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    doctorsFuture = loadDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doctor List')),
      body: FutureBuilder<List<Doctor>>(
        future: doctorsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No doctors available.'));
          } else {
            final doctors = snapshot.data!;
            return ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(Icons.person, size: 40),
                    title: Text(doctor.name),
                    subtitle: Text(
                      '${doctor.specialization}\n⭐ ${doctor.rating.toString()}',
                    ),
                    isThreeLine: true,
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                BookAppointmentScreen(doctor: doctor),
                          ),
                        );
                      },
                      child: const Text('Book'),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
