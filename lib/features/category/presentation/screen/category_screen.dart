import 'package:craftybay/features/shared/presentation/providers/category_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/providers/main_nav_holder_provider.dart';
import '../../../shared/widgets/category_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  static const String name = '/category-screen';

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ScrollController _scrollController = ScrollController();

  late final CategoryListProvider _categoryListProvider;

  @override
  void initState() {
    _categoryListProvider = context.read<CategoryListProvider>();

    _scrollController.addListener(_loadMore);

    super.initState();
  }

  void _loadMore() {
    if ((_categoryListProvider.isLoading == false) &&
        _scrollController.position.extentBefore < 300) {
      _categoryListProvider.getCategory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) => _backToHome(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.read<MainNavHolderProvider>().backToHome();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text('Category'),
        ),
        body: ChangeNotifierProvider.value(
          value: _categoryListProvider,
          child: Consumer<CategoryListProvider>(

            builder: (context, _, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          _categoryListProvider.refreshCategoryList();
                        },
                        child: GridView.builder(
                          itemCount: _categoryListProvider.categoryList.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.8,
                          ),
                          itemBuilder: (context, index) {
                            return CategoryCard();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }

  void _backToHome() {
    context.read<MainNavHolderProvider>().backToHome();
  }
}
