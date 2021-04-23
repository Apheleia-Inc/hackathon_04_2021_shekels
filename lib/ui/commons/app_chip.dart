import 'package:flutter/material.dart';
import 'package:hackathon_04_2021_shekels/utils/theme_color_utils.dart';

class AppChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function(bool newValue) onSelected;

  const AppChip({
    Key key,
    @required this.text,
    @required this.isSelected,
    @required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      checkmarkColor: Colors.white,
      label: Text(
        this.text,
        style: TextStyle(
          color: this.isSelected
              ? Colors.white
              : Colors.grey[800],
          fontSize: 14,
        ),
      ),
      selectedColor: Theme.of(context).primaryColor,
      backgroundColor: Colors.white,
      shape: StadiumBorder(
        side: BorderSide(
          width: 1,
          color: this.isSelected
              ? Theme.of(context).primaryColor
              : Colors.grey[800],
        ),
      ),
      selected: this.isSelected,
      onSelected: (bool selected) {
        this.onSelected(selected);
      },
    );
  }
}
