import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/center_circular_progress_indicator.dart';
import '../providers/products_review_provider.dart';
import '../widgets/product_review_widget.dart';
import '../widgets/review_count_and_create_section.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key, required this.productId});
  static const String name = '/product-review-screen';

  final String productId;

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  final ProductsReviewProvider _productsReviewProvider =
      ProductsReviewProvider();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    debugPrint('Product Review Init State');
    _productsReviewProvider.getReviewListData(widget.productId);
    _scrollController.addListener(_loadMore);
    super.initState();
  }

  void _loadMore() {
    if (_productsReviewProvider.isLoading == false &&
        (_scrollController.position.extentBefore < 400)) {
      _productsReviewProvider.getReviewListData(widget.productId);
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Product Review Screen build');
    return ChangeNotifierProvider.value(
      value: _productsReviewProvider,
      child: Scaffold(
        appBar: AppBar(title: Text('Review Screen')),
        body: Consumer<ProductsReviewProvider>(
          builder: (context, _, _) {
            if (_productsReviewProvider.errorMessage != null) {
              return Center(child: Text(_productsReviewProvider.errorMessage!));
            }

            if (_productsReviewProvider.isInitialLoading) {
              return CenterCircularProgressIndicator();
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: _productsReviewProvider.reviewList.length,
                      itemBuilder: (context, index) {
                        final review =
                            _productsReviewProvider.reviewList[index];
                        return ReviewCard(review: review);
                      },
                    ),
                  ),
                ),
                if (_productsReviewProvider.isLoadingMore)
                  LinearProgressIndicator(),
                ReviewCountAndCreateSection(),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
