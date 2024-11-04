import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/core/localization/generated/l10n.dart';

class ErrorPlaceHolder extends StatelessWidget {
  const ErrorPlaceHolder({
    super.key,
    required this.onTap,
    required this.errorMessage,
  });

  final String errorMessage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => onTap(),
              child: Text(
                S.of(context).reload,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
