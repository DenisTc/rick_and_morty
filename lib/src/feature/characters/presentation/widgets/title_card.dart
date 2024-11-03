import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Text(
        'Rick Sanchez Rick Sanchez Rick Sanchez Rick Sanchez',
        style: Theme.of(context).textTheme.bodyLarge,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
