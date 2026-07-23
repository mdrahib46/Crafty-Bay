import 'package:craftybay/features/shared/widgets/center_circular_progress_indicator.dart';
import 'package:craftybay/features/shared/widgets/show_snackbar_message.dart';
import 'package:craftybay/features/wish_list/presentation/provider/remove_wish_list_item_provider.dart';
import 'package:craftybay/features/wish_list/presentation/provider/wish_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/providers/main_nav_holder_provider.dart';
import '../../../shared/widgets/product_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  static const String name = '/wish-list-screen';

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishListProvider _wishListProvider = WishListProvider();
  final ScrollController _scrollController = ScrollController();
  final RemoveWishListItemProvider _removeWishListItemProvider =
      RemoveWishListItemProvider();

  @override
  void initState() {
    _wishListProvider.getWishListData();
    _scrollController.addListener(loadMore);
    super.initState();
  }

  void loadMore() {
    if (_wishListProvider.isLoading == false &&
        (_scrollController.position.extentBefore < 300)) {
      _wishListProvider.getWishListData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _wishListProvider),
        ChangeNotifierProvider.value(value: _removeWishListItemProvider),
      ],
      child: Consumer<WishListProvider>(
        builder: (context, _, _) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (_, __) => _backToHome,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Wish List'),
                leading: IconButton(
                  onPressed: _backToHome,
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ),
              body: Consumer<WishListProvider>(
                builder: (context, _, _) {
                  if (_wishListProvider.isInitialLoading) {
                    return CenterCircularProgressIndicator();
                  }

                  if (_wishListProvider.errorMessage != null) {
                    return Center(
                      child: Text('${_wishListProvider.errorMessage}'),
                    );
                  }

                  return Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: RefreshIndicator(
                            onRefresh: () async {
                              _wishListProvider.refreshWishList();
                            },
                            child: GridView.builder(
                              controller: _scrollController,
                              itemCount: _wishListProvider.wishList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 4,
                                    childAspectRatio: 0.7,
                                  ),
                              itemBuilder: (context, index) {
                                return Consumer<RemoveWishListItemProvider>(
                                  builder: (context, _, _) {
                                    if (_removeWishListItemProvider
                                        .itemInProgress) {
                                      return CenterCircularProgressIndicator();
                                    }
                                    return FittedBox(
                                      child: Stack(
                                        children: [
                                          ProductCard(
                                            productModel: _wishListProvider
                                                .wishList[index]
                                                .productModel,
                                          ),

                                          Positioned(
                                            top: 10,
                                            right: 8,
                                            child: GestureDetector(
                                              onTap: () => _onTapRemoveItem(
                                                _wishListProvider
                                                    .wishList[index]
                                                    .wishListId,
                                              ),
                                              child: CircleAvatar(
                                                backgroundColor: Colors.red
                                                    .withAlpha(50),
                                                radius: 16,
                                                child: Icon(
                                                  Icons.delete_forever_outlined,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      if (_wishListProvider.isLoadingMore)
                        LinearProgressIndicator(),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }


  /// Delete Wishlist Item
  void _onTapRemoveItem(String itemId) async {
    final bool isSuccess = await _removeWishListItemProvider.deleteWishListItem(
      itemId,
    );
    if (!mounted) return;
    if (isSuccess) {
      _wishListProvider.removeWishListItem(itemId);
      showSnackBarMessage(context, _removeWishListItemProvider.successMsg!);
    } else {
      showSnackBarMessage(context, _removeWishListItemProvider.errorMessage!);
    }
  }

  void _backToHome() {
    context.read<MainNavHolderProvider>().backToHome();
  }
}
