import 'package:flutter/material.dart';
import 'package:quiz/models/problem.dart';
import 'package:quiz/widgets/problem_block.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ProblemBlock(
          problem: Problem(
            question: '今日の石原さとみのパンツの色は？',
            answer: 0,
            choices: ['赤', '青', '紫'],
          ),
        ),
      ),
    );
  }
}
