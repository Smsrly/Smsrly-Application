import 'package:flutter/material.dart';

import '../../../res/colors.dart';
class DefaultProgressBar extends StatelessWidget {
  const DefaultProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(
          primaryColor
      ),
    );
  }
}
