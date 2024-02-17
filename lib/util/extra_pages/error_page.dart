
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  static const pageName = '/errorpage';
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: Colors.red,
          child: const Center(
              child: Text(
            'Something went wrong',
            style: TextStyle(
              color: Colors.white,
            ),
          )),
        ),
      ),
    );
  }
}
