import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final double initialValue;
  final double minValue;
  final double maxValue;
  final ValueChanged<double>? onChanged;

  const SliderWidget({
    Key? key,
    required this.initialValue,
    required this.minValue,
    required this.maxValue,
    this.onChanged,
  }) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Slider(
        activeColor: const Color(0xFFFFBF9B),
        value: _value,
        min: widget.minValue,
        max: widget.maxValue,
        onChanged: (newValue) {
          setState(() {
            _value = newValue;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(_value);
          }
        },
      ),
    );
  }
}
