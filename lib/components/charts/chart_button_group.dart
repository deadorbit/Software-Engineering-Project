import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartButtonGroup extends StatefulWidget {
  final void Function(int) onChanged;

  const ChartButtonGroup({super.key, required this.onChanged});

  @override
  State<ChartButtonGroup> createState() => _ChartButtonGroupState();
}

class _ChartButtonGroupState extends State<ChartButtonGroup> {
  int _selected = 1;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                _selected = 0;
              });
              widget.onChanged(_selected);
            },
            style: ElevatedButton.styleFrom(
              shape: const ContinuousRectangleBorder(),
              elevation: _selected == 0 ? 1.0 : 2.0,
              backgroundColor: _selected == 0 ? Colors.blue[200] : Colors.white,
            ),
            child: const Text(
              'WEEK',
              style: TextStyle(
                color: Colors.black,
              ),
            )),
      ),
      Expanded(
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                _selected = 1;
              });
              widget.onChanged(_selected);
            },
            style: ElevatedButton.styleFrom(
              shape: const ContinuousRectangleBorder(),
              elevation: _selected == 1 ? 1.0 : 2.0,
              backgroundColor: _selected == 1 ? Colors.blue[200] : Colors.white,
            ),
            child: const Text(
              'MONTH',
              style: TextStyle(
                color: Colors.black,
              ),
            )),
      ),
      Expanded(
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                _selected = 2;
              });
              widget.onChanged(_selected);
            },
            style: ElevatedButton.styleFrom(
              shape: const ContinuousRectangleBorder(),
              elevation: _selected == 2 ? 1.0 : 2.0,
              backgroundColor: _selected == 2 ? Colors.blue[200] : Colors.white,
            ),
            child: const Text(
              'YEAR',
              style: TextStyle(
                color: Colors.black,
              ),
            )),
      ),
    ]);
  }
}
