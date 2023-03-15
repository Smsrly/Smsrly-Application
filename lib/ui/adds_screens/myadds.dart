import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/ui/strings.dart';
import 'package:smsrly/ui/widgets/colors.dart';

import 'requested.dart';
import 'save.dart';
import 'uploaded.dart';

class MyAdds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70.h,
            backgroundColor: primaryColor,
            title: const Text(StringManeger.adds),
            bottom: TabBar(
              indicatorWeight: 2,
              indicatorColor: Colors.white,
              tabs: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    StringManeger.uploaded,
                    style: getIBMPlexSansFont(15.sp, FontWeight.w400),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    StringManeger.requested,
                    style: getIBMPlexSansFont(15.sp, FontWeight.w400),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      StringManeger.saved,
                      style: getIBMPlexSansFont(15.sp, FontWeight.w400),
                    )),
              ],
            ),
          ),
          body: TabBarView(
            children: [Uploaded(), Requested(), Saved()],
          ),
        ));
  }
}
