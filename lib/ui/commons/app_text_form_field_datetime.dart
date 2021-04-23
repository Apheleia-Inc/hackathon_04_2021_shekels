import 'package:flutter/material.dart';
import 'package:hackathon_04_2021_shekels/utils/datetime_utils.dart';

class AppTextFormFieldDatetime extends StatefulWidget {
  final TextEditingController textController;
  final DateTime initialDate;
  final Function(DateTime newDate) onChanged;
  final InputDecoration decoration;

  AppTextFormFieldDatetime({
    Key key,
    this.textController,
    this.initialDate,
    this.onChanged,
    this.decoration,
  }) : super(key: key);

  @override
  _AppTextFormFieldDatetimeState createState() =>
      _AppTextFormFieldDatetimeState();
}

class _AppTextFormFieldDatetimeState extends State<AppTextFormFieldDatetime> {
  TextEditingController _textController;
  TextEditingController _dummyTextController = TextEditingController();
  bool _hasSyncControllers = false;
  DateTime _currentDate;
  String _oldTextValue;

  @override
  void initState() {
    super.initState();

    _textController = widget.textController ?? _dummyTextController;
    _initInitialDate();
  }

  @override
  void didUpdateWidget(covariant AppTextFormFieldDatetime oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.textController != null) {
      if (_hasSyncControllers == false) {
        _textController = widget.textController;
        _initInitialDate();
        _hasSyncControllers = true;
      }
    }
  }

  @override
  void dispose() {
    _dummyTextController.dispose();
    super.dispose();
  }

  void _initInitialDate() {
    // If widget.initialDate != null => Use it as initialDate
    if (widget.initialDate != null) {
      _setCurrentDate(widget.initialDate);
    }
    // If widget.initialDate == null => Try to use textController.text as initialDate
    else {
      _changeCurrentDateByTextController();
      _textController.addListener(() {
        if (_textController.text == _oldTextValue) {
          return;
        }
        _changeCurrentDateByTextController();
      });
    }
  }

  // Try to use textController.text as initialDate
  void _changeCurrentDateByTextController() {
    DateTime initialDateFromText = DateTime.tryParse(_textController.text);
    if (initialDateFromText != null) {
      _setCurrentDate(initialDateFromText);
    } else {
      _setCurrentDate(DateTime.now());
    }
  }

  void _setCurrentDate(DateTime date) {
    _currentDate = date ?? DateTime.now();
    _textController.text = DateTimeUtils.getDateString(date);
    _oldTextValue = _textController.text;
    if (widget.onChanged != null) {
      widget.onChanged(date);
    }
  }

  Future<void> _showAppDatePicker() async {
    DateTime selectedDate = await showDatePicker(
      context: context,
      initialDate: _currentDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate == null) {
      return;
    }

    _setCurrentDate(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: () {
        _showAppDatePicker();
      },
      decoration: widget.decoration,
      controller: _textController,
    );
  }
}
