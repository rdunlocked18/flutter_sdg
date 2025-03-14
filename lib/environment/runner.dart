import 'package:flutter/material.dart';
import 'package:flutter_dropdown_cleanblc/environment/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: const MyApp()));
}
