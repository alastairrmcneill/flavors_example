import 'package:firebase_core/firebase_core.dart';
import 'package:flavors/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App(flavor: "Production"));
}
