import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:hackathon_04_2021_shekels/extensions/list_extension.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/app_bottom_sheet.dart';
import 'package:hackathon_04_2021_shekels/utils/theme_color_utils.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

enum DropDownType {
  /// used in select depareture manually screen
  BoxDropdown,

  /// used in sign up screen
  TextfieldDropdown,
}

class AppDropdown<ValueT> extends StatefulWidget {
  final List<AppDropdownItem<ValueT>> items;
  final ValueT initialValue;
  final Function(ValueT selectedValue) onChanged;
  final String placeholder;
  final DropDownType type;

  AppDropdown({
    Key key,
    @required this.items,
    this.initialValue,
    @required this.onChanged,
    this.placeholder = '',
    this.type = DropDownType.BoxDropdown,
  }) : super(key: key);

  @override
  _AppDropdownState<ValueT> createState() => _AppDropdownState<ValueT>();
}

class _AppDropdownState<ValueT> extends State<AppDropdown<ValueT>> {
  List<AppDropdownItem<ValueT>> _items = [];
  AppDropdownItem<ValueT> _selectedItem;
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _items = widget.items != null ? widget.items : [];
    _selectedItem =
        _items.firstOrDefault((x) => x.value == widget.initialValue);
    _textController.text = _selectedItem?.label;
  }

  Function _onDropdownPressed() {
    if (_items.length <= 0) {
      return null;
    }

    return () {
      Get.bottomSheet(
        DropdownBottomSheetModal<ValueT>(
          placeholder: widget.placeholder,
          items: _items,
          selectedValue: _selectedItem?.value,
          onChanged: (item) {
            _selectedItem = item;
            _textController.text = _selectedItem.label;
            // setState(() {});
            widget.onChanged(item.value);
          },
        ),
        isScrollControlled: true,
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          onTap: _onDropdownPressed(),
          controller: _textController,
          readOnly: true,
          focusNode: AlwaysDisabledFocusNode(),
          decoration: InputDecoration(
            isDense: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: widget.placeholder,
            labelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
            ),
            hintText: 'Press to select',
            border: OutlineInputBorder(),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: Center(
              child: Icon(
                Entypo.chevron_down,
                color: Colors.grey,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );

    // ! Currently unused
    // return Material(
    //   child: Ink(
    //     decoration: _buildOutline(),
    //     child: InkWell(
    //       onTap: _onDropdownPressed(),
    //       child: Container(
    //         height: _getFieldHeight(),
    //         width: double.infinity,
    //         padding: EdgeInsets.symmetric(horizontal: 10),
    //         child: Row(
    //           children: <Widget>[
    //             Expanded(
    //               child: Text(
    //                 _getDropdownText(widget.placeholder),
    //                 style: TextStyle(
    //                   color: _selectedItem != null
    //                       ? Colors.grey[800]
    //                       : Colors.grey,
    //                 ),
    //               ),
    //             ),
    //             _getDropDownIcon(),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  String _getDropdownText(String name) {
    if (_items.length <= 0 || _selectedItem == null) {
      return 'Select ${name}';
    }

    return _selectedItem.label;
  }

  BoxDecoration _buildOutline() {
    switch (widget.type) {
      case DropDownType.BoxDropdown:
        return BoxDecoration(
          border: Border.all(width: 1, color: Color.fromRGBO(194, 194, 194, 1)),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        );
      case DropDownType.TextfieldDropdown:
        return BoxDecoration(
          border: Border.all(width: 1, color: Color.fromRGBO(242, 242, 242, 1)),
          borderRadius: BorderRadius.circular(5),
          color: Color.fromRGBO(247, 247, 247, 1),
        );
      default:
        return null;
    }
  }

  double _getFieldHeight() {
    switch (widget.type) {
      case DropDownType.BoxDropdown:
        return 40.0;
      case DropDownType.TextfieldDropdown:
        return 50.0;
      default:
        return 40.0;
    }
  }

  Icon _getDropDownIcon() {
    switch (widget.type) {
      case DropDownType.BoxDropdown:
        return Icon(
          Icons.arrow_drop_down,
          color: _items.length > 0 ? Colors.grey[700] : Colors.grey,
        );
      case DropDownType.TextfieldDropdown:
        return Icon(
          Entypo.chevron_small_down,
          color: _items.length > 0 ? Colors.grey[700] : Colors.grey,
          size: 30,
        );
      default:
        return Icon(
          Icons.arrow_drop_down,
          color: _items.length > 0 ? Colors.grey[700] : Colors.grey,
        );
    }
  }
}

class DropdownBottomSheetModal<ValueT> extends StatefulWidget {
  final String placeholder;
  final List<AppDropdownItem<ValueT>> items;
  final ValueT selectedValue;
  final Function(AppDropdownItem<ValueT>) onChanged;

  DropdownBottomSheetModal({
    Key key,
    @required this.placeholder,
    @required this.items,
    @required this.selectedValue,
    @required this.onChanged,
  }) : super(key: key);

  @override
  _DropdownBottomSheetModalState<ValueT> createState() =>
      _DropdownBottomSheetModalState<ValueT>();
}

class _DropdownBottomSheetModalState<ValueT>
    extends State<DropdownBottomSheetModal<ValueT>> {
  final _selectedItemKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500), () {
      if (_selectedItemKey.currentContext != null) {
        Scrollable.ensureVisible(_selectedItemKey.currentContext,
            duration: Duration(milliseconds: 500));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      height: Get.height * 2 / 5,
      title: widget.placeholder,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...widget.items.map((item) => _buildItemButton(item)).toList()
          ],
        ),
      ),
    );
  }

  Widget _buildItemButton(AppDropdownItem<ValueT> item) {
    bool isSelected = widget.selectedValue == item.value;

    return Container(
      key: isSelected ? _selectedItemKey : null,
      padding: EdgeInsets.only(
        left: isSelected ? 25 : 15,
        right: 15,
        top: 5,
      ),
      child: Material(
        child: Ink(
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).primaryColor.withOpacity(0.15)
                : Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              Get.back();
              widget.onChanged(item);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                item.label,
                style: TextStyle(
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.grey[800],
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppDropdownItem<ValueT> {
  ValueT value;
  String label;

  AppDropdownItem({
    this.value,
    this.label,
  });
}
