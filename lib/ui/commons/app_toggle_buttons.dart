// import 'package:flutter/material.dart';
// import 'package:hackathon_04_2021_shekels/utils/theme_color_utils.dart';

// class AppToggleButtons<T> extends StatelessWidget {
//   final List<AppToggleButtonItem<T>> items;
//   final List<T> selectedValues;
//   final Function(T value) onPressedValue;
//   final double width;

//   const AppToggleButtons({
//     Key key,
//     @required this.items,
//     @required this.selectedValues,
//     @required this.onPressedValue,
//     this.width = double.infinity,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         ...this.items.map((item) {
//           bool isSelected = this.selectedValues.contains(item.value);
//           bool isFirstItem = this.items.indexOf(item) == 0;
//           bool isLastItem = this.items.indexOf(item) == this.items.length - 1;

//           return Expanded(
//             child: Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 onTap: () {
//                   this.onPressedValue(item.value);
//                 },
//                 child: Ink(
//                   padding: EdgeInsets.symmetric(vertical: 8),
//                   decoration: BoxDecoration(
//                     color: isSelected
//                         ? Theme.of(context).primaryColor
//                         : Colors.grey,
//                     borderRadius: BorderRadius.horizontal(
//                       left: isFirstItem ? Radius.circular(8) : Radius.zero,
//                       right: isLastItem ? Radius.circular(8) : Radius.zero,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       item.label,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: isSelected
//                             ? ThemeColorUtils.getOnPrimary(context)
//                             : ThemeColorUtils.getOnLightGrey(context),
//                         fontWeight: FontWeight.w500,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }).toList(),
//       ],
//     );
//   }
// }

// class AppToggleButtonItem<T> {
//   final T value;
//   final String label;

//   AppToggleButtonItem({
//     @required this.value,
//     @required this.label,
//   });
// }
