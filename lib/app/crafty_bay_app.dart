

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/home/presentation/provider/home_carousel_slider_provider.dart';
import '../features/shared/presentation/providers/main_nav_holder_provider.dart';
import '../features/wish_list/presentation/provider/add_wish_list_item_provider.dart';
import '../l10n/app_localizations.dart';
import 'app_theme.dart';
import 'providers/language_toggle_provider.dart';
import 'providers/theme_mode_provider.dart';
import 'routes.dart';

class CraftyBayApp extends StatefulWidget {
  const CraftyBayApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<CraftyBayApp> createState() => _CraftyBayAppState();
}

class _CraftyBayAppState extends State<CraftyBayApp> {
  final ThemeModeProvider _themeModeProvider = ThemeModeProvider();
  final LanguageToggleProvider _languageToggleProvider =
      LanguageToggleProvider();

  @override
  void initState() {
    _themeModeProvider.setDefaultThemeMode();
    _languageToggleProvider.setDefaultLocale();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _themeModeProvider),
        ChangeNotifierProvider.value(value: _languageToggleProvider),
        ChangeNotifierProvider(create: (_)=> MainNavHolderProvider()),
        ChangeNotifierProvider(create: (_)=> HomeCarouselSliderProvider()),
        ChangeNotifierProvider(
          create: (_) => AddToWishlistItemProvider(),
        ),
      ],
      child: Consumer<LanguageToggleProvider>(
        builder: (context, languageProvider, child) {
          return Consumer<ThemeModeProvider>(
            builder: (context, themeModeProvider, _) {
              return MaterialApp(
                navigatorKey: CraftyBayApp.navigatorKey,
                debugShowCheckedModeBanner: false,
                title: "Crafty Bay",
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeModeProvider.themeMode,
                initialRoute: SplashScreen.name,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                supportedLocales: [Locale('en'), Locale('bn')],
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: languageProvider.currentLocal,
              );
            },
          );
        },
      ),
    );
  }
}
