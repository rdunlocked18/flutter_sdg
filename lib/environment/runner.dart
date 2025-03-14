import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_dropdown_cleanblc/core/resources/app_constants.dart';
import 'package:flutter_dropdown_cleanblc/environment/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> mainCommon() async {
  dotenv.load(fileName: AppConstants.dotEnvPath);
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: const MyApp()));
}
