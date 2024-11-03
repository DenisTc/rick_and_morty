import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/core/theme/app_theme.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(5),
            backgroundColor: Colors.white,
            elevation: 1,
            minimumSize: const Size(40, 40),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppTheme.nero,
            size: 24,
          ),
        ),
      ),
    );
  }
}
