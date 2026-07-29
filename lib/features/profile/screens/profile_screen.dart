import 'package:craftybay/app/app_colors.dart';
import 'package:craftybay/features/profile/provider/read_user_profile_provider.dart';
import 'package:craftybay/features/shared/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String name = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final TextEditingController _firstNameTEController =
      TextEditingController();
  late final TextEditingController _lastNameTEController =
      TextEditingController();
  late final TextEditingController _emailTEController = TextEditingController();
  late final TextEditingController _mobileTEController =
      TextEditingController();
  late final TextEditingController _cityTEController = TextEditingController();
  late final TextEditingController _photoUrlTEController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> hasChanges = ValueNotifier(false);

  final ReadUserProfileProvider _readUserProfileProvider =
      ReadUserProfileProvider();

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    bool success = await _readUserProfileProvider.readUserProfile();

    if (!mounted) return;

    if (success) {
      final user = _readUserProfileProvider.userData;

      _firstNameTEController.text = user?.firstName ?? '';
      _lastNameTEController.text = user?.lastName ?? '';
      _emailTEController.text = user?.email ?? '';
      _mobileTEController.text = user?.phone ?? '';
      _cityTEController.text = user?.city ?? '';
      _photoUrlTEController.text = user?.avatarUrl ?? '';
    }
  }

  // bool _hasChanges = false;

  void _checkChanges() {
    final user = _readUserProfileProvider.userData;

    if (user == null) return;

    final changed =
        _firstNameTEController.text != (user.firstName ?? '') ||
            _lastNameTEController.text != (user.lastName ?? '') ||
            _mobileTEController.text != (user.phone ?? '') ||
            _cityTEController.text != (user.city ?? '') ||
            _photoUrlTEController.text != (user.avatarUrl ?? '');

    if (hasChanges.value != changed) {
      hasChanges.value = changed;
    }
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _readUserProfileProvider,
      child: Consumer<ReadUserProfileProvider>(
        builder: (context, provider, child) {
          if (provider.inProgress) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return Scaffold(
            appBar: AppBar(title: const Text('User Profile')),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  onChanged: _checkChanges,
                  child: Column(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.themeColor,
                            width: 4,
                          ),
                        ),
                        child: ClipOval(
                          child:
                              provider.userData?.avatarUrl != null &&
                                  provider.userData!.avatarUrl!.isNotEmpty
                              ? Image.network(
                                  provider.userData!.avatarUrl!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) {
                                    return const Icon(Icons.person, size: 60);
                                  },
                                )
                              : const Icon(Icons.person, size: 60),
                        ),
                      ),

                      const SizedBox(height: 20),

                      TextFormField(
                        controller: _firstNameTEController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'First Name',
                        ),
                        validator: (value) =>
                            Validators.validateInput(value, 'Enter first name'),
                      ),

                      const SizedBox(height: 10),

                      TextFormField(
                        controller: _lastNameTEController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Last Name',
                        ),
                        validator: (value) =>
                            Validators.validateInput(value, 'Enter last name'),
                      ),

                      const SizedBox(height: 10),

                      TextFormField(
                        controller: _emailTEController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email',
                        ),
                        validator: Validators.validateEmail,
                      ),

                      const SizedBox(height: 10),

                      TextFormField(
                        controller: _mobileTEController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          hintText: 'Mobile',
                        ),
                        validator: Validators.validateMobile,
                      ),

                      const SizedBox(height: 10),

                      TextFormField(
                        controller: _cityTEController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.location_city),
                          hintText: 'City',
                        ),
                        validator: (value) =>
                            Validators.validateInput(value, 'Enter city'),
                      ),

                      const SizedBox(height: 10),

                      TextFormField(
                        controller: _photoUrlTEController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.link),
                          hintText: 'Photo URL',
                        ),
                        validator: (value) =>
                            Validators.validateInput(value, 'Enter photo url'),
                      ),

                      const SizedBox(height: 25),

                      ValueListenableBuilder<bool>(
                        valueListenable: hasChanges,
                        builder: (context, changed, child) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            child: changed
                                ? SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                onPressed: _onTapSubmit,
                                child: const Text('Update'),
                              ),
                            )
                                : const SizedBox.shrink(),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _emailTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _photoUrlTEController.dispose();

    _readUserProfileProvider.dispose();

    super.dispose();
  }


  void _onTapSubmit() {
    if (_formKey.currentState!.validate()) {
      // TODO: Call update profile API
    }
  }
}
