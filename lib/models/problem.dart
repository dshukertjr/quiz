import 'package:flutter/foundation.dart';

class Problem {
  final String question;
  final List<String> choices;
  final int answer;

  Problem({
    @required this.question,
    @required this.choices,
    @required this.answer,
  });
}
