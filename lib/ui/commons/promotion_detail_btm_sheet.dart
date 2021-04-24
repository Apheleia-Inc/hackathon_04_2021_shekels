import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:get/get.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/app_bottom_sheet.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/app_button.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/custom_network_image.dart';

class PromotionDetailBtmSheet extends StatefulWidget {
  PromotionDetailBtmSheet({Key key}) : super(key: key);

  @override
  _PromotionDetailBtmSheetState createState() =>
      _PromotionDetailBtmSheetState();
}

class _PromotionDetailBtmSheetState extends State<PromotionDetailBtmSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 5 / 6,
      color: Colors.grey[100],
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [],
            ),
          ),
          Positioned(
            top: -50,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10000),
                    child: Container(
                      width: 150,
                      height: 150,
                      child: CustomNetworkImage(
                        fit: BoxFit.contain,
                        imageUrl:
                            'https://upload.wikimedia.org/wikipedia/vi/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1024px-Starbucks_Corporation_Logo_2011.svg.png',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Starbucks Cashback',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '10% Cashback',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        _buildSection(
                          'From card',
                          CreditCardWidget(
                            cardNumber: '4242 4242 4242 4242',
                            expiryDate: '12/23',
                            cardHolderName: 'Thang Nguyen',
                            cvvCode: '123',
                            showBackView: false,
                            cardBgColor: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        SizedBox(height: 10),
                        _buildSection(
                          'Promotion Info',
                          _PromoInfoSection(),
                        ),
                      ],
                    ),
                  ),
                ),
                // Actions
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey[100],
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          onPressed: () {},
                          child: Text('Add Promotion to Card'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSection(
    String title,
    Widget body,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.grey[850],
              fontSize: 18,
              // fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body,
      ],
    );
  }
}

class _PromoInfoSection extends StatefulWidget {
  const _PromoInfoSection({
    Key key,
  }) : super(key: key);

  @override
  __PromoInfoSectionState createState() => __PromoInfoSectionState();
}

class __PromoInfoSectionState extends State<_PromoInfoSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: _buildInfoItem('Expired At', 'Apr 1st 21'),
              ),
              SizedBox(width: 20),
              Expanded(
                child: _buildInfoItem('Category', 'Drinks'),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: _buildInfoItem('Store', 'Starbucks'),
              ),
              SizedBox(width: 20),
              Expanded(
                child: _buildInfoItem('Store URL', 'Go to Store'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
    String title,
    String value, {
    Function onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 1),
              blurRadius: 3,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 5),
            Text(
              value,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
