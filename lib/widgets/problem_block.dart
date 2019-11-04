import 'package:flutter/material.dart';
import 'package:quiz/models/problem.dart';

class ProblemBlock extends StatefulWidget {
  final Problem problem;

  const ProblemBlock({
    Key key,
    @required this.problem,
  }) : super(key: key);

  @override
  _ProblemBlockState createState() => _ProblemBlockState();
}

class _ProblemBlockState extends State<ProblemBlock> {
  int choice;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.8,
      ),
      child: Material(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(widget.problem.question),
              choice == null ? _beforeAnswering() : _afterAnswering(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _beforeAnswering() {
    return Wrap(
      children: List.generate(
          widget.problem.choices.length,
          (index) => FlatButton(
                child: Text(widget.problem.choices[index]),
                onPressed: () {
                  _answered(index);
                },
              )),
    );
  }

  Widget _afterAnswering() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            widget.problem.answer == choice ? '正解！' : '残念...',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: widget.problem.answer == choice ? Colors.red : Colors.blue,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 8),
          Text('答えは${widget.problem.choices[widget.problem.answer]}です！'),
        ],
      ),
    );
  }

  void _answered(int index) {
    setState(() {
      choice = index;
    });
  }
}
