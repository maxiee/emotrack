import 'package:drift/drift.dart' as drift;
import 'package:emotrack/db/db.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class EmoRating extends StatefulWidget {
  EmoRating({super.key, required this.hourDatetime});

  DateTime hourDatetime;

  @override
  State<EmoRating> createState() => _EmoRatingState();
}

class _EmoRatingState extends State<EmoRating> {
  static const ratings = ['😭', '😣', '😐', '🙂', '😆'];

  String? _currentSelect;
  EmoScoreData? _currentEmoData;

  @override
  void initState() {
    GetIt.I
        .get<AppDatabase>()
        .getSingleEmoScoreByTs(widget.hourDatetime)
        .then((ret) {
      if (ret != null) {
        setState(() {
          _currentEmoData = ret;
          _currentSelect = emoScoreToEmoji(ret);
        });
      }
    });
  }

  String emoScoreToEmoji(EmoScoreData scoreData) {
    return ratings[scoreData.score + 2];
  }

  int emojiToEmoScore(String emo) {
    return ratings.indexOf(emo) - 2;
  }

  bool isEdit() => _currentEmoData != null;

  onEmoClicked(String emo) async {
    if (isEdit()) {
      await onEditEmoScore(emojiToEmoScore(emo));
    } else {
      await onAddNewEmoScore(emojiToEmoScore(emo));
    }
    setState(() {
      _currentSelect = emo;
    });
  }

  onAddNewEmoScore(int score) async {
    final newScore = EmoScoreCompanion.insert(
        hourTimestamp: widget.hourDatetime, score: score);
    return GetIt.I.get<AppDatabase>().createOrUpdateEmoScore(newScore);
  }

  onEditEmoScore(int score) async {
    assert(_currentEmoData != null);
    final editScore = EmoScoreCompanion.insert(
        id: drift.Value(_currentEmoData!.id),
        hourTimestamp: widget.hourDatetime,
        score: score);
    return GetIt.I.get<AppDatabase>().createOrUpdateEmoScore(editScore);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: ratings
          .map((e) => TextButton(
              onPressed: () => onEmoClicked(e),
              child: _currentSelect == e
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
