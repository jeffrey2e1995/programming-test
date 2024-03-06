import 'package:flutter/material.dart';
import 'package:people_list/infrastructure/data/local/database/database.dart';
import 'package:people_list/infrastructure/singletons/singletons.dart';
import 'package:people_list/presentation/app_widget.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:people_list/utils/connectivity/connectivity_status_listener.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load env file
  await dotenv.load(fileName: "env/.env");

  // Initialize local database
  await AppDatabase.initDatabase();

  // setup environment
  await setupSingletons();

  // Check Connectivity
  await ConnectionStatusListener.initialize();

  runApp(const AppWidget());
}
