import 'package:craftybay/features/product/data/models/create_review_params.dart';
import 'package:craftybay/features/product/presentation/providers/create_review_provider.dart';
import 'package:craftybay/features/shared/widgets/center_circular_progress_indicator.dart';
import 'package:craftybay/features/shared/widgets/show_snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key, required this.productId});

  static const String name = '/create-review';

  final String productId;

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _ratingsTEController = TextEditingController();
  final TextEditingController _reviewTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final CreateReviewProvider _createReviewProvider = CreateReviewProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _createReviewProvider,
      child: Scaffold(
        appBar: AppBar(title: Text('Create Review')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _ratingsTEController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Product Rating',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty == true) {
                      return 'Enter product rating';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _reviewTEController,
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: 'Write Review',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Write your valuable comments !';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                Consumer<CreateReviewProvider>(
                  builder: (context, _, _) {
                    if (_createReviewProvider.inProgress) {
                      return CenterCircularProgressIndicator();
                    }
                    return FilledButton(
                      onPressed: _onTapReviewSubmit,
                      child: Text('Submit'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapReviewSubmit() {
    if (_formKey.currentState!.validate()) {
      createReview();
    }
  }

  void createReview() async {
    final bool isSuccess = await _createReviewProvider.createReview(
      CreateReviewParams(
        widget.productId,
        _ratingsTEController.text.trim(),
        _reviewTEController.text.trim(),
      ),
    );

    if (!mounted) return;
    if (isSuccess) {
      showSnackBarMessage(context, _createReviewProvider.successMsg!);
      _clearDate();
      Navigator.pop(context, true);
    } else {
      showSnackBarMessage(
        context,
        _createReviewProvider.errorMessage!,
        isError: true,
      );
    }
  }

  void _clearDate() {
    _ratingsTEController.clear();
    _reviewTEController.clear();
  }

  @override
  void dispose() {
    _ratingsTEController.dispose();
    _reviewTEController.dispose();
    super.dispose();
  }
}
