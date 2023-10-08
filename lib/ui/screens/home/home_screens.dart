import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/provider/settings_provider.dart';
import 'package:islami/ui/screens/home/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islami/ui/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami/ui/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami/ui/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami/ui/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreens extends StatefulWidget {
  static const String routeName = "home";

   HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
             settingsProvider.isDarkMode()?
              AppAssets.darkBackGround : AppAssets.backGround),
          fit: BoxFit.fill,
        )
      ),
        child:  Scaffold(
          appBar: AppBar(

            title:  Text(
              AppLocalizations.of(context)!.islami),
          ),
          body: tabs[currentTabIndex],

          bottomNavigationBar:buildBottomNavigationBar() ,
        )
    );
  }

  Widget buildBottomNavigationBar () => Theme(
    data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
    child: BottomNavigationBar(
      currentIndex: currentTabIndex,
     onTap: (index){
        currentTabIndex=index;
        setState(() {

        });
     },

    items: [
      const BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icQuran)),label: "القرآن"),
      const BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icHadeth)),label: "الأحاديث"),
      const BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icSebha)),label: "التسبيح"),
      const BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icRadio)),label: "الراديو"),
      BottomNavigationBarItem(icon: const Icon(Icons.settings),label: AppLocalizations.of(context)!.settings),
    ],
        ),
  );
}
