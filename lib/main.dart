import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/provider/settings_provider.dart';
import 'package:islami/ui/screens/details_screen/details_screen.dart';
import 'package:islami/ui/screens/home/home_screens.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => SettingsProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  late SettingsProvider provider ;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return MaterialApp(
     debugShowCheckedModeBanner: false,

      localizationsDelegates:[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: [Locale("en"),Locale("ar")],
      locale: Locale(provider.currentLocale),
      themeMode: provider.currentMode,
      theme: AppTheme.lightTheme,
      darkTheme:AppTheme.darkTheme,
      routes: {
        HomeScreens.routeName : (_) => HomeScreens(),
        DetailsScreen.routeName : (_) => DetailsScreen(),
      },
      initialRoute: HomeScreens.routeName,
    );
  }


}


