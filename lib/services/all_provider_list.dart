import 'package:demo_food/provider/dish_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../provider/dish_details_provider.dart';

List<SingleChildWidget> allproviderList() {
  return [
    ChangeNotifierProvider(create: (_) => DishListProvider()),
    ChangeNotifierProvider(create: (_) => DishDetailsProvider()),
  ];
}
