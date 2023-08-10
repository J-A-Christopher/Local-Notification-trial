import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String? payLoad;
  const SecondPage({super.key, required this.payLoad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome brejin'),
      ),
      body: Center(
        child: Text('$payLoad'),
      ),
    );
  }
}
