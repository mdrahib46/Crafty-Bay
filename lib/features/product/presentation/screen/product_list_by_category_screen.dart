import 'package:craftybay/features/product/presentation/providers/product_list_providers.dart';
import 'package:craftybay/features/shared/widgets/center_circular_progress_indicator.dart';
import 'package:craftybay/features/shared/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListByCategoryScreen extends StatefulWidget {
  const ProductListByCategoryScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });
  static const String name = '/product-list-by-category';

  final String categoryId;
  final String categoryName;

  @override
  State<ProductListByCategoryScreen> createState() =>
      _ProductListByCategoryScreenState();
}

class _ProductListByCategoryScreenState
    extends State<ProductListByCategoryScreen> {
  final ProductListProviders _productListProviders = ProductListProviders();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _productListProviders.getProductList();
    _scrollController.addListener(loadMore);
    super.initState();
  }

  void loadMore() {
    if (_productListProviders.isLoading == false &&
        (_scrollController.position.extentBefore < 300)) {
      _productListProviders.getProductList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _productListProviders,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.categoryName)),
        body: Consumer<ProductListProviders>(
          builder: (context, _, _) {
            if (_productListProviders.isInitialLoading) {
              return CenterCircularProgressIndicator();
            }

            print(_productListProviders.productList.length);
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GridView.builder(
                      controller: _scrollController,
                      itemCount: _productListProviders.productList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 4,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        return FittedBox(
                          child: ProductCard(
                            productModel:
                                _productListProviders.productList[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (_productListProviders.isLoadingMore)
                  LinearProgressIndicator(),
              ],
            );
          },
        ),
      ),
    );
  }


}
