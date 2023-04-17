import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/res/colors.dart';
import 'package:smsrly/res/styles.dart';

import 'requested.dart';
import 'save.dart';
import 'uploaded.dart';

class MyAdds extends StatelessWidget {
  const MyAdds({super.key});


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70.h,
            backgroundColor: primaryColor,
            title: const Text(StringManager.adds),
            bottom: TabBar(
              indicatorWeight: 2,
              indicatorColor: Colors.white,
              tabs: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    StringManager.uploaded,
                    style: AppStyles.getBodyText1(Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    StringManager.requested,
                    style: AppStyles.getBodyText1(Colors.white),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      StringManager.saved,
                      style: AppStyles.getBodyText1(Colors.white),
                    )),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Uploaded(),
              Requested(),
              Saved()
            ],
          ),
        ));
  }
}
