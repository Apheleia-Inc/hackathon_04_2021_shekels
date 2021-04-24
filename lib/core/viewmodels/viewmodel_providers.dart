import 'package:hackathon_04_2021_shekels/core/viewmodels/implements/ccards_viewmodel.dart';
import 'package:hackathon_04_2021_shekels/core/viewmodels/implements/promotion_viewmodel.dart';
import 'package:hackathon_04_2021_shekels/core/viewmodels/interfaces/iccards_viewmodel.dart';
import 'package:hackathon_04_2021_shekels/core/viewmodels/interfaces/ipromotions_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> viewmodelProviders = [
  ChangeNotifierProvider<ICCardsViewmodel>(
    create: (_) => CCardsViewmodel(),
  ),
  ChangeNotifierProvider<IPromotionsViewmodel>(
    create: (_) => PromotionsViewmodel(),
  ),
];
