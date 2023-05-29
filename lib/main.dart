import 'package:flutter/material.dart';
import 'package:projeto_gs1/screens/homescreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: TelaInicial(),
      ),
    ),
  );
}

