import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/app_bottom_sheet.dart';

class FilterPromotionsBtmSheet extends StatefulWidget {
  FilterPromotionsBtmSheet({Key key}) : super(key: key);

  @override
  _FilterPromotionsBtmSheetState createState() =>
      _FilterPromotionsBtmSheetState();
}

class _FilterPromotionsBtmSheetState extends State<FilterPromotionsBtmSheet> {
  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      height: Get.height * 5 / 6,
      title: 'Filter Promotions',
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSection(
                'Sort by',
                _SortBySection(),
              ),
              _buildSection(
                'Distance',
                _SliderDistanceSection(),
              ),
              _buildSection(
                'Categories',
                _CategorySelectSection(),
              ),
            ],
          ),
        ),
      ),
      actions: [
        AppBottomSheetAction(
          onPressed: () {},
          child: Text('Apply Filters'),
        ),
      ],
    );
  }

  Widget _buildSection(
    String title,
    Widget body,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          body,
        ],
      ),
    );
  }
}

class _SortBySection extends StatefulWidget {
  _SortBySection({Key key}) : super(key: key);

  @override
  __SortBySectionState createState() => __SortBySectionState();
}

class __SortBySectionState extends State<_SortBySection> {
  String _selectedValue = 'relevance';

  @override
  Widget build(BuildContext context) {
    double horizontalGap = 10;
    double verticalGap = 10;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildSelectBtn('relevance', 'Relevance'),
            ),
            SizedBox(width: horizontalGap),
            Expanded(
              child: _buildSelectBtn('popularity', 'Popularity'),
            ),
          ],
        ),
        SizedBox(height: verticalGap),
        Row(
          children: [
            Expanded(
              child: _buildSelectBtn('distance', 'Distance'),
            ),
            SizedBox(width: horizontalGap),
            Expanded(
              child: _buildSelectBtn('availability', 'Availability'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectBtn(String value, String text) {
    bool isSelected = _selectedValue == value;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedValue = value;
          });
        },
        child: Ink(
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.grey[350],
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.grey[600],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliderDistanceSection extends StatefulWidget {
  _SliderDistanceSection({Key key}) : super(key: key);

  @override
  __SliderDistanceSectionState createState() => __SliderDistanceSectionState();
}

class __SliderDistanceSectionState extends State<_SliderDistanceSection> {
  double _currentValue = 100;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('0 km'),
        Expanded(
          child: FlutterSlider(
            values: [_currentValue],
            max: 100,
            min: 0,
            onDragging: (handlerIndex, lowerValue, upperValue) {
              _currentValue = lowerValue;
              setState(() {});
            },
            onDragCompleted: (handlerIndex, lowerValue, upperValue) {
              _currentValue = lowerValue;
              setState(() {});
            },
            tooltip: FlutterSliderTooltip(
              format: (value) {
                return '$value km';
              },
              textStyle: TextStyle(
                // color: Colors.grey[800],
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            trackBar: FlutterSliderTrackBar(
              activeTrackBar: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            handler: FlutterSliderHandler(
              decoration: BoxDecoration(),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(1000),
                ),
                padding: EdgeInsets.all(0),
                // child: Icon(
                //   Icons.adjust,
                //   size: 25,
                // ),
              ),
            ),
          ),
        ),
        Text('100 km'),
      ],
    );
  }
}

class _CategorySelectSection extends StatefulWidget {
  _CategorySelectSection({Key key}) : super(key: key);

  @override
  __CategorySelectSectionState createState() => __CategorySelectSectionState();
}

class __CategorySelectSectionState extends State<_CategorySelectSection> {
  List<String> _categoryList = [
    'Babies & Kids',
    'Bags & Luggage',
    'Books & Magazines',
    'Cameras',
    'Clothing & Accesories',
    'Computers',
    'Drinks',
    'Food',
    'Ganes',
    'Shoes',
    'Travel',
    'TVs',
  ];

  List<String> _selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _categoryList.length,
      itemBuilder: (context, index) {
        String category = _categoryList[index];
        bool isSelected = _selectedCategories.contains(category);

        return CheckboxListTile(
          value: isSelected,
          onChanged: (value) {
            if (value == true) {
              _selectedCategories.add(category);
            } else {
              _selectedCategories.remove(category);
            }
            setState(() {});
          },
          dense: true,
          title: Text(category),
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );
  }
}
