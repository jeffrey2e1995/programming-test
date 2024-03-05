import 'package:flutter/material.dart';
import 'package:people_list/infrastructure/singletons/singletons.dart';
import 'package:people_list/presentation/app_widget.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load env file
  await dotenv.load(fileName: "env/.env");

  // setup environment
  await setupSingletons();

  runApp(const AppWidget());
}
