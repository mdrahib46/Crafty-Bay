import 'package:flutter/material.dart';

import '../widgets/review_count_and_create_section.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});
  static const String name = '/product-review-screen';

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Review')),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            spacing: 8,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.withAlpha(50),
                                radius: 15,
                                child: Icon(
                                  Icons.person_outline,
                                  color: Colors.grey.shade600,
                                ),
                              ),

                              Text(
                                'User Name',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966.",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ReviewCountAndCreateSection()
        ],
      ),
    );
  }
}
