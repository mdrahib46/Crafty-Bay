
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/providers/main_nav_holder_provider.dart';
import '../../../shared/widgets/center_circular_progress_indicator.dart';
import '../../../shared/widgets/show_snackbar_message.dart';
import '../provider/cart_provider.dart';
import '../provider/delete_cart_item_provider.dart';
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
  final DeleteCartItemProvider _deleteCartItemProvider =
      DeleteCartItemProvider();

  @override
  void initState() {
    _cartListProvider.getCartListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _cartListProvider),
        ChangeNotifierProvider.value(value: _deleteCartItemProvider),
      ],
      child: PopScope(
        onPopInvokedWithResult: (_, __) => _backToHome,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            leading: IconButton(
              onPressed: _backToHome,
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Consumer<CartListProvider>(
            builder: (context, _, _) {
              if (_cartListProvider.isLoading) {
                return const CenterCircularProgressIndicator();
              }

              if (_cartListProvider.cartItemList.isEmpty) {
                return const Center(child: Text('No cart item available....!'));
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
                        final item = _cartListProvider.cartItemList[index];

                        return Consumer<DeleteCartItemProvider>(
                          builder: (context, _, _) {
                            return CartItem(
                              cartItemModel:
                                  _cartListProvider.cartItemList[index],
                              onTapDelete: () => deleteCartItem(
                                _cartListProvider.cartItemList[index].id,
                              ),
                              isDeleting:
                                  _deleteCartItemProvider.deletingItemId ==
                                  item.id,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const TotalPriceAndCheckoutSection(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> deleteCartItem(String itemId) async {
    final bool isSuccess = await _deleteCartItemProvider.deleteCartItem(itemId);

    if (!mounted) return;

    if (isSuccess) {
      _cartListProvider.removeCartItem(itemId);

      showSnackBarMessage(context, _deleteCartItemProvider.successMessage!);
    } else {
      showSnackBarMessage(
        context,
        _deleteCartItemProvider.errorMessage!,
        isError: true,
      );
    }
  }

  void _backToHome() {
    context.read<MainNavHolderProvider>().backToHome();
  }
}
