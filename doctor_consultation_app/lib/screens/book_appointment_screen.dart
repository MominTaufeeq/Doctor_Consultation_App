import 'package:flutter/material.dart';
import '../models/doctor.dart';

class BookAppointmentScreen extends StatefulWidget {
  final Doctor doctor;

  const BookAppointmentScreen({super.key, required this.doctor});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  // ✅ Regular expressions for validation
  final RegExp _dateRegex = RegExp(
    r'^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-\d{4}$',
  ); // DD-MM-YYYY
  final RegExp _timeRegex = RegExp(
    r'^(0?[1-9]|1[0-2]):[0-5][0-9]\s?(AM|PM)$',
  ); // HH:MM AM/PM

  void _bookAppointment() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '✅ Appointment booked with ${widget.doctor.name} on ${_dateController.text} at ${_timeController.text}.',
          ),
          duration: const Duration(seconds: 3),
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Appointment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Doctor: ${widget.doctor.name}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // 🔹 Patient name field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Your Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your name' : null,
              ),

              // 🔹 Date field with format validation
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Date (Format: DD-MM-YYYY)',
                  hintText: 'e.g. 15-11-2025',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  } else if (!_dateRegex.hasMatch(value)) {
                    return 'Enter date in DD-MM-YYYY format';
                  }
                  return null;
                },
              ),

              // 🔹 Time field with format validation
              TextFormField(
                controller: _timeController,
                decoration: const InputDecoration(
                  labelText: 'Time (Format: HH:MM AM/PM)',
                  hintText: 'e.g. 10:30 AM',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a time';
                  } else if (!_timeRegex.hasMatch(value)) {
                    return 'Enter time in HH:MM AM/PM format';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              // 🔹 Confirm Booking button
              ElevatedButton(
                onPressed: _bookAppointment,
                child: const Text('Confirm Booking'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
