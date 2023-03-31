import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/models/realestate.dart';
import 'package:smsrly/res/styles.dart';

import '../../../res/strings.dart';

class SecondItem extends StatelessWidget {
  late RealEstate item;
  late bool hasSaved;
  VoidCallback? onSaveBtn;

  SecondItem(
      {Key? key,
      required this.item,
      required this.hasSaved,
      required this.onSaveBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      height: 130.h,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Colors.white,
        elevation: 25,
        child: SizedBox(
          height: 130.h,
          child: Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  width: 120.w,
                  height: 130.h,
                  fit: BoxFit.cover,
                  image: NetworkImage(item.imageUrl),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: AppStyles.bodyText2),
                  Row(
                    children: [
                      SizedBox(
                          width: 12,
                          height: 16.h,
                          child: Image.asset(StringManager.locationIcon)),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                          item.city != null && item.country != null
                              ? "${item.country}, ${item.city}"
                              : "${item.latitude}, ${item.longitude}",
                          style: AppStyles.bodyText1),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 20,
                          height: 20.h,
                          child: Image.asset(StringManager.areaIcon)),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${item.area} ${StringManager.areaUnit}",
                        style: TextStyle(
                            fontFamily: StringManager.ibmPlexSans,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            color: const Color.fromRGBO(103, 103, 103, 1)),
                      ),
                    ],
                  ),
                  Text("${item.price} ${StringManager.egyptianPound}",
                      style: TextStyle(
                          fontFamily: StringManager.ibmPlexSans,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: const Color.fromRGBO(14, 82, 137, 1))),
                ],
              ),
              const Expanded(flex: 5, child: SizedBox()),
              Column(
                children: [
                  Container(
                      width: 30,
                      height: 30,
                      margin: const EdgeInsets.all(5),
                      child: InkWell(
                        child: Image.asset(hasSaved
                            ? StringManager.savedIconBlue
                            : StringManager.unSaveIconBlue),
                        onTap: () {
                          onSaveBtn!();
                        },
                      )),
                  const Expanded(flex: 1, child: SizedBox()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
