import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/models/realestate.dart';

class SecondItem extends StatelessWidget {
  late RealEstate item;
  late bool hasSaved;
  VoidCallback? onSaveBtn;
  SecondItem({Key? key, required this.item, required this.hasSaved, required this.onSaveBtn}) : super(key: key);

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
              SizedBox(width: 10.w,),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title,
                      style: TextStyle(
                          fontSize: 17.sp, fontFamily: "IBMPlexSans",
                          fontWeight: FontWeight.w400,
                      )),
                  Row(
                    children: [
                      SizedBox(
                          width: 12,
                          height: 16.h,
                          child: Image.asset("assets/images/black_location_icon.png")),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                          item.city != null && item.country!= null
                          ? "${item.country}, ${item.city}"
                          : "${item.location.late}, ${item.location.long}",
                          style: TextStyle(
                              fontFamily: "IBMPlexSans",
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp,
                              color: const Color.fromRGBO(103, 103, 103, 1))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 20,
                          height: 20.h,
                          child: Image.asset("assets/images/area_icon.png")),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${item.area} m²",
                        style: TextStyle(
                            fontFamily: "IBMPlexSans",
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            color: const Color.fromRGBO(103, 103, 103, 1)),
                      ),
                    ],
                  ),
                  Text("${item.price} EGP",
                      style: TextStyle(
                          fontFamily: "IBMPlexSans",
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
                        child: Image.asset(hasSaved?"assets/images/saved_icon_blue.png":"assets/images/save_icon_blue.png"),
                        onTap:(){
                          onSaveBtn!();
                        },
                      )
                  ),
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
