import 'package:flutter/material.dart';

import '../../data/models/product_review_model.dart';


class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});

  final ProductReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 8,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.withAlpha(50),
                  radius: 16,
                  child: review.photoUrl == null
                      ? Icon(
                    Icons.person,
                    color: Colors.grey.shade600,
                  )
                      : Image.network(
                    review.photoUrl!,
                    errorBuilder: (_, _, _) {
                      return Icon(
                        Icons.person,
                        color: Colors.grey.shade600,
                      );
                    },
                  ),
                ),

                Text(
                  '${review.firstName} ${review.lastName}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(review.comment, style: TextStyle(color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }
}