🩺 Doctor Consultation App (Basic Version)
📘 Objective

A simple Flutter mobile application that allows users to:

View a list of doctors (Name, Specialization, Rating)

Book an appointment by filling a form (Name, Doctor, Date, Time)

See a confirmation message after successful booking

🧩 Features

✅ Two Screens:

Doctor List Screen – Displays doctors loaded from a local JSON file

Book Appointment Screen – Allows booking with input validation

✅ Local JSON file used as mock data source
✅ Date and Time format validation (DD-MM-YYYY, HH:MM AM/PM)
✅ Confirmation message shown after booking using a SnackBar

🛠️ Technologies Used

Flutter (latest stable version)

Dart language

Local JSON file for data storage

Material Design UI Components

📁 Folder Structure
doctor_consultation_app/
│
├── assets/
│   └── doctors.json
│
├── lib/
│   ├── main.dart
│   ├── models/
│   │   └── doctor.dart
│   ├── screens/
│   │   ├── doctor_list_screen.dart
│   │   └── book_appointment_screen.dart
│
└── pubspec.yaml

▶️ How to Run the Project
1. Install Flutter

Make sure Flutter SDK is installed.
Check by running:

flutter --version

2. Clone or Download the Project
git clone https://github.com/yourusername/doctor_consultation_app.git
cd doctor_consultation_app


(If this is a local college submission, just unzip and open the folder in VS Code or Android Studio.)

3. Install Dependencies
flutter pub get

4. Run the App

Connect a mobile device or start an emulator, then run:

flutter run


💬 Output Summary

Doctor List Screen: Lists all doctors from JSON

Book Appointment Screen: Allows booking an appointment


Confirmation Message: Displays after successful form submission

🏁 Conclusion

This project demonstrates the use of Flutter UI, form handling, local JSON data, and basic validation to create a simple yet functional Doctor Consultation App.

Screen OutPut:-
![WhatsApp Image 2025-11-13 at 3 49 35 PM (2)](https://github.com/user-attachments/assets/bebcb96e-2d98-4513-bc27-aeeff56476ae)

![WhatsApp Image 2025-11-13 at 3 49 35 PM (1)](https://github.com/user-attachments/assets/90c818ce-7124-4a22-b36d-a3868813b89c)

![WhatsApp Image 2025-11-13 at 3 49 35 PM](https://github.com/user-attachments/assets/95e1df7a-8e10-4b07-83ce-e99b4cebf2d8)

