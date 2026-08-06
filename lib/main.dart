import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_venue_admin/features/authentication/repository/admin_auth_repository.dart';
import 'package:your_venue_admin/features/authentication/view/screens/admin_auth_gate.dart';
import 'package:your_venue_admin/features/authentication/view_modes/bloc/admin_auth_bloc/admin_auth_bloc.dart';
import 'package:your_venue_admin/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final AdminAuthRepository adminAuthRepository = AdminAuthRepository();

  runApp(
    RepositoryProvider<AdminAuthRepository>.value(
      value: adminAuthRepository,
      child: BlocProvider<AdminAuthBloc>(
        create: (context) => AdminAuthBloc(
          adminAuthRepository: context.read<AdminAuthRepository>(),
        )..add(const CheckAdminAuthEvent()),
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminAuthGate(),
    );
  }
}
