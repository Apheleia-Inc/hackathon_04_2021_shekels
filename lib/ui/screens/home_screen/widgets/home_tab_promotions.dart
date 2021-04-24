import 'package:flutter/material.dart';
import 'package:hackathon_04_2021_shekels/core/dtos/promotion_dto.dart';
import 'package:hackathon_04_2021_shekels/core/viewmodels/interfaces/ipromotions_viewmodel.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/custom_network_image.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/link_card_btn.dart';
import 'package:hackathon_04_2021_shekels/utils/bottom_sheet_utils.dart';
import 'package:provider/provider.dart';

class HomeTabPromotions extends StatefulWidget {
  HomeTabPromotions({Key key}) : super(key: key);

  @override
  _HomeTabPromotionsState createState() => _HomeTabPromotionsState();
}

class _HomeTabPromotionsState extends State<HomeTabPromotions> {
  IPromotionsViewmodel _viewmodel;

  @override
  void initState() {
    super.initState();

    _viewmodel = context.read<IPromotionsViewmodel>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Store name, Promotion type, etc...',
                        hintStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Material(
                    child: InkWell(
                      onTap: () {
                        BottomSheetUtils.showFilterPromotionsBS();
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.sort,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Text(
              'You have to link your bank cards in order to have promos included here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[850],
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Expanded(
            child: Consumer<IPromotionsViewmodel>(
              builder: (context, __, ___) {
                if (_viewmodel.promotionList.length <= 0) {
                  return Column(
                    children: [
                      SizedBox(height: 10),
                      LinkCardBtn(),
                    ],
                  );
                }

                return ListView.builder(
                  itemCount: _viewmodel.promotionList.length,
                  itemBuilder: (context, index) {
                    PromotionDto promo = _viewmodel.promotionList[index];

                    return _buildPromoItem(promo);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoItem(PromotionDto promotion) {
    return Stack(
      key: ValueKey(promotion.id),
      children: [
        GestureDetector(
          onTap: () {
            BottomSheetUtils.showPromotionDetailBS(promotion);
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.black12,
                  blurRadius: 1,
                )
              ],
            ),
            height: 130,
            child: Row(
              children: [
                Container(
                  width: 130,
                  child: CustomNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: promotion.store.imageUrl,
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              promotion.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.grey[850],
                              ),
                            ),
                            SizedBox(height: 2),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: promotion.description,
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' at ${promotion.store.name}',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Category
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              promotion.category,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'NEW',
              style: TextStyle(
                fontSize: 11,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
