import 'package:flutter/material.dart';

class BtnShowPopup<ItemKey> extends StatelessWidget {
  final Widget child;
  final List<BtnShowPopupItem<ItemKey>> items;
  final Function(ItemKey selectedItem) onSelectedItem;

  const BtnShowPopup({
    Key key,
    @required this.child,
    @required this.items,
    @required this.onSelectedItem,
  }) : super(key: key);

  Future<void> _onPressedWatchListMenu(
    BuildContext context,
    Offset position,
  ) async {
    ItemKey itemClicked = await _showWatchListPopupMenu(context, position);
    this.onSelectedItem(itemClicked);
  }

  Future<ItemKey> _showWatchListPopupMenu(
    BuildContext context,
    Offset position,
  ) async {
    final left = position.dx;
    final top = position.dy;

    return await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        ...this.items.map((menuItem) {
          return PopupMenuItem<ItemKey>(
            value: menuItem.key,
            child: Text(
              menuItem.text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: menuItem.color,
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) async {
        await _onPressedWatchListMenu(context, details.globalPosition);
      },
      child: this.child,
    );
  }
}

class BtnShowPopupItem<ItemKey> {
  final ItemKey key;
  final String text;
  final Color color;

  BtnShowPopupItem({
    @required this.key,
    @required this.text,
    @required this.color,
  });
}
