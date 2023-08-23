import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavors/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'general/notifiers/notifiers.dart';
import 'general/services/services.dart';

class App extends StatelessWidget {
  final String flavor;
  const App({super.key, required this.flavor});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>.value(
          value: AuthService.appUserStream,
          initialData: null,
        ),
        ChangeNotifierProvider<UserNotifier>(
          create: (_) => UserNotifier(),
        ),
      ],
      child: const MaterialApp(
          title: 'Flutter Flavours Example',
          debugShowCheckedModeBanner: false,
          home: Wrapper()),
    );
  }
}
