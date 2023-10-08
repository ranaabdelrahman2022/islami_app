import 'package:flutter/material.dart';
import 'package:islami/model/details_screen_argument.dart';
import 'package:islami/ui/screens/details_screen/details_screen.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_theme.dart';
import 'package:islami/ui/utils/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
            child: Image.asset(AppAssets.quranLogo)),
       const Divider(),
        Text(AppLocalizations.of(context)!.suraName,
          style: Theme.of(context).textTheme.displayMedium,
          textAlign: TextAlign.center,),
        Divider(),
        Expanded(
          flex: 7,
            child:ListView.builder(
              itemCount:Constant.suraName.length,
                itemBuilder: (_,index){
                 return TextButton(onPressed: (){
                 Navigator.pushNamed(context, DetailsScreen.routeName,
                 arguments: DetailsScreenArguments(suraOrHadethName: Constant.suraName[index],
                     fileName:"${index+1}.txt",
                     isQuranFile: true)
                 );
                 },
                     child: Text(Constant.suraName[index],
                   textAlign: TextAlign.center,
                   style: AppTheme.quranTabTitleTextStyle.copyWith(fontWeight: FontWeight.normal),)
                 );
                }
            ),
        )
      ],
    );
  }
}
