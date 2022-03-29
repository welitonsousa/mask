import 'package:flutter/material.dart';
import 'package:mask/mask/mask.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final editController = TextEditingController();

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => Mask.validations.cpf(value),
              inputFormatters: [Mask.cpf()],
              decoration: const InputDecoration(labelText: 'CPF'),
            ),
          ],
        ),
      ),
    );
  }
}
