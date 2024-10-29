import 'package:como_vai/presentation/screens/tela_integracao.dart';
import 'package:flutter/material.dart';



class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: OnboardingScreen(),
    );
  }
}