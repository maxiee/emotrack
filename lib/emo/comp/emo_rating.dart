import 'package:flutter/material.dart';

class EmoRating extends StatefulWidget {
  const EmoRating({super.key});

  @override
  State<EmoRating> createState() => _EmoRatingState();
}

class _EmoRatingState extends State<EmoRating> {
  static const ratings = ['😭', '😣', '😐', '🙂', '😆'];

  String? currentSelect;

  onEmoClicked(String emo) {
    setState(() {
      currentSelect = emo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: ratings
          .map((e) => TextButton(
              onPressed: () => onEmoClicked(e),
              child: currentSelect == e
                  ? Text(
                      e,
                      style: const TextStyle(fontSize: 24),
                    )
                  : Container(
                      foregroundDecoration: const BoxDecoration(
                          color: Colors.grey,
                          backgroundBlendMode: BlendMode.saturation),
                      child: Text(
                        e,
                        style: const TextStyle(fontSize: 24),
                      ),
                    )))
          .toList(),
    );
  }
}
