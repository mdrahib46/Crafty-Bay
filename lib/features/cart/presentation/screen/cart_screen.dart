import 'package:craftybay/features/cart/presentation/provider/cart_provider.dart';
import 'package:craftybay/features/shared/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/providers/main_nav_holder_provider.dart';
import '../widgets/cart_item.dart';
import '../widgets/total_price_and_checkout_section.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  static const String name = '/cart-screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartListProvider _cartListProvider = CartListProvider();

  @override
  void initState() {
    _cartListProvider.getCartListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _cartListProvider,
      child: PopScope(
        onPopInvokedWithResult: (_, __) => _backToHome,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
            leading: IconButton(
              onPressed: _backToHome,
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Consumer<CartListProvider>(
            builder: (context, _, _) {
              if (_cartListProvider.isLoading) {
                return CenterCircularProgressIndicator();
              }

              if (_cartListProvider.cartItemList.isEmpty) {
                return Center(child: Text('No cart item available....!'));
              }

              if (_cartListProvider.errorMessage != null) {
                return Center(child: Text(_cartListProvider.errorMessage!));
              }

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _cartListProvider.cartItemList.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          cartItemModel: _cartListProvider.cartItemList[index],
                        );
                      },
                    ),
                  ),
                  TotalPriceAndCheckoutSection(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _backToHome() {
    context.read<MainNavHolderProvider>().backToHome();
  }
}
