import 'package:flutter/material.dart';

import 'service/tflite_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TfliteModel();
  }
}
