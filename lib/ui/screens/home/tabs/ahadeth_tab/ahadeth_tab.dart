import 'package:flutter/material.dart';
import 'package:islami/model/details_screen_argument.dart';
import 'package:islami/ui/screens/details_screen/details_screen.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_theme.dart';
import 'package:islami/ui/utils/constant.dart';

class AhadethTab extends StatelessWidget {
   AhadethTab({super.key});
List<String> ahadethNames = List.generate(50, (index) {
 return "${index+1}رقم الحديث ";
});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Image.asset(AppAssets.ahadethLogo)),
        const Divider(
          thickness: 2,
          color: AppColors.primary,
        ),
        Text("Hadeth Name",

          style: AppTheme.quranTabTitleTextStyle,textAlign: TextAlign.center),
        const Divider(
          thickness: 2,
          color: AppColors.primary,
        ),
        Expanded(
          flex: 7,
          child:ListView.builder(
              itemCount:Constant.suraName.length,
              itemBuilder: (_,index){
                return TextButton(onPressed: (){
                  Navigator.pushNamed(context, DetailsScreen.routeName,
                      arguments: DetailsScreenArguments(suraOrHadethName: ahadethNames[index],
                          fileName:"h${index+1}.txt",
                          isQuranFile: false,),
                  );
                },
                    child: Text(ahadethNames[index],
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
