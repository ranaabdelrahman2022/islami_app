import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/details_screen_argument.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_theme.dart';

class DetailsScreen extends StatefulWidget {

 static const String routeName = "details_screen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
late DetailsScreenArguments arguments;

 String fileContact="";
 int ayaCount=0;

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments as DetailsScreenArguments;
     if (fileContact.isEmpty){
       readFile();
     }
     return Container(
         decoration: const BoxDecoration(
             image: DecorationImage(
               image: AssetImage(AppAssets.backGround),
               fit: BoxFit.fill,
             )
         ),
         child:  Scaffold(
           appBar: AppBar(
             elevation: 0.0,
             backgroundColor: AppColors.transparent,
             centerTitle: true,
             title:  Text(
               arguments.suraOrHadethName,
               style: AppTheme.appBarTitleTextStyle,
             ),
           ),
           backgroundColor: AppColors.transparent,
           body: Padding(
             padding: const EdgeInsets.all(16.0),
             child: fileContact.isEmpty ?const Center(child: CircularProgressIndicator()):
              SingleChildScrollView(
                child: Text(fileContact,
                 textAlign: TextAlign.center,
                 textDirection:TextDirection.rtl ,
                 style: const TextStyle(
                 fontSize: 18,
                 color: AppColors.accent,
             ),),
              ),
           ),

         )
     );
  }

  void readFile() async {
    String file = await rootBundle.loadString(
      arguments.isQuranFile ?
        "assets/files/quran1/${arguments.fileName}":
      "assets/files/ahadeth1/${arguments.fileName}"
    );
    fileContact = file;
    List<String> fileLines = file.split("\n");
    for(int i=0; i<fileLines.length; i++){
      fileLines[i]+= arguments.isQuranFile ?"(${i+1})": " ";

    }
    fileContact =fileLines.join();
    setState(() {});

  }
}
