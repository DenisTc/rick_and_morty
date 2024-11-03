import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/core/theme/app_theme.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(5),
            backgroundColor: Colors.white,
            elevation: 1,
            minimumSize: const Size(40, 40)),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: Tween<double>(begin: 0.3, end: 1.0).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_outline,
            key: ValueKey<bool>(isFavorite),
            color: AppTheme.irisBlue,
            size: 24,
          ),
        ),
      ),
    );
  }
}
