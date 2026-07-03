import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  static const String name = '/create-review';

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _reviewTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Review')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameTEController,
                decoration: InputDecoration(
                  hintText: 'First Name',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty == true) {
                    return 'Enter your first name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _lastNameTEController,
                decoration: InputDecoration(
                  hintText: 'Last Name',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty == true) {
                    return 'Enter your last name';
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
              FilledButton(
                onPressed: _onTapReviewSubmit,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapReviewSubmit() {
    if (_formKey.currentState!.validate()) {}
  }
}
