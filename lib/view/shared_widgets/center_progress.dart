import 'package:flutter/material.dart';

class CenterProgress extends StatelessWidget {
  const CenterProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}
