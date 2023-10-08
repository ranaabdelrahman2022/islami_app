import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Container(
      width: width,
      margin: EdgeInsets.only(top: height*0.05),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height*0.39,
            child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding:EdgeInsets.only(left: width*0.1),
                      child: Image.asset(
                        "assets/images/head of seb7a.png",
                        height:height*0.1,
                        width: width*0.2,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        "assets/images/body of seb7a.png",
                        height:height*0.25,
                        width: width*0.5,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
          ),
          SizedBox(height: height*0.05),
          Text(
          AppLocalizations.of(context)?.tasbeah??"" ,
          style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: height*0.05),
          Container(
            padding: EdgeInsets.all(height*0.025),
            decoration: BoxDecoration(
              color: Color(0xFFB7935F).withOpacity(0.57),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              "30",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: height*0.03),
          ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: Text(
                "سبحان الله",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
          )
        ],
      ),
    );
  }
}
