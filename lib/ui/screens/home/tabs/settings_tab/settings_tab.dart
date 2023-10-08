import 'package:flutter/material.dart';
import 'package:islami/provider/settings_provider.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool arSwitch=false;
  bool darkMoodSwitch=false;
  late SettingsProvider provider ;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.settings,
           style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.start),
          buildSettingsRow("العربيه", arSwitch, (newValue) {
            arSwitch=newValue;
            if(arSwitch){
              provider.setCurrentLocale("ar");
            }
            else{
              provider.setCurrentLocale("en");
            }

          }),
          buildSettingsRow(AppLocalizations.of(context)!.darkMode, darkMoodSwitch, (newValue) {
            darkMoodSwitch=newValue;
            if(darkMoodSwitch){
              provider.setCurrentMode(ThemeMode.dark);
            }
            else{
              provider.setCurrentMode(ThemeMode.light);
            }
          }),

        ],
      ),
    );
  }

  Widget buildSettingsRow (String title, bool switchvalue, Function(bool) onChanged){
    return Row(
      children: [
        SizedBox(width: 16,),
        Text(title,style:Theme.of(context).textTheme.bodySmall),
        Spacer(),
        Switch(value: switchvalue, onChanged: onChanged, activeColor: AppColors.primary,)


      ],
    );
  }
}
