import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/providers/language_toggle_provider.dart';


class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LanguageToggleProvider>();

    return DropdownButton<Locale>(
      value: provider.locale,
      items: const [
        DropdownMenuItem(
          value: Locale('en'),
          child: Text('English'),
        ),
        DropdownMenuItem(
          value: Locale('bn'),
          child: Text('বাংলা'),
        ),
      ],
      onChanged: (locale) {
        if (locale != null) {
          context.read<LanguageToggleProvider>().changeLocale(locale);
        }
      },
    );
  }
}