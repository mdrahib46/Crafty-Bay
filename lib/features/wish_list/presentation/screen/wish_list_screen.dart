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
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_, __) => _backToHome,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Wish List'),
          leading: IconButton(
            onPressed: _backToHome,
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            itemCount: 12,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 4,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return FittedBox(child:
              SizedBox()
              // ProductCard()
              /// Todo : Implement Product card
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
