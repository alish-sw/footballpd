import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/features/feature_authentication/presentation/bloc/authentication_bloc.dart';

import 'features/feature_authentication/presentation/screen/authentication_page.dart';
import 'firebase_options.dart';
import 'locator.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  await setup();
  runApp( MaterialApp(home: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => locator<AuthenticationBloc>()),

        ],
        child: const AuthenticationFlowScreen(),
      )
  )
  )
  );
}



