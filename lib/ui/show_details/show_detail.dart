import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/res/colors.dart';
import 'package:smsrly/res/styles.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_back_button.dart';
import 'package:smsrly/ui/widgets/user_items/user_item.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../models/realestate.dart';
import '../../models/user.dart';
import '../../res/strings.dart';

class ShowDetailsScreen extends StatelessWidget {
  late RealEstate item;
  var isTheOwner = false;

  ShowDetailsScreen({Key? key}) : super(key: key);

  Widget priceRow() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text("${item.price} ${StringManager.egyptianPound}",
              textAlign: TextAlign.center,
              style: AppStyles.bodyText5),
        ),
        5.he,
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: isTheOwner
                ? () {
                    // for the owner
                    // will add it later
                  }
                : () {
                    // for the normal user
                    // will add it later
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: isTheOwner
                  ? redColor
                  : primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20),
              child: Text(
                isTheOwner ? StringManager.delete : StringManager.request,
                style: TextStyle(fontSize: 18.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget userCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: shadowColor2,
            blurRadius: 50.0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: !isTheOwner,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          item.ownerInfo?.imageUrl != null
                          ? item.ownerInfo?.imageUrl as String
                          : "https://user-images.githubusercontent.com/90563044/215369020-31ed45db-baa0-4175-a7ae-c31629fa7fdb.png"),
                    ),
                    5.w.wi,
                    Text(
                    item.ownerInfo!.name,
                      style: const TextStyle(
                          fontFamily: 'IBMPlexSans',
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Visibility(
                  visible: true,
                  child: InkWell(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: darkBlue,
                          borderRadius: BorderRadius.circular(13)),
                      child: Image.asset(StringManager.phoneIconPath),
                    ),
                    onTap: () {
                      launch("tel://");
                    },
                  ),
                ),
              ],
            ),
          ),
          2.h.he,
          Text(
            item.description,
            style: const TextStyle(
              fontFamily: 'IBMPlexSans',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Widget loading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 70.0.h,
          width: 80.0.w,
          child: const CircularProgressIndicator(),
        ),
      ],
    );
  }

  Widget infoRow(String iconLocation, String text) {
    return Row(
      children: [
        SizedBox(
          width: 20.w,
          height: 20,
          child: Image.asset(iconLocation),
        ),
        SizedBox(width: 3.w),
        Text(
          text,
          style: TextStyle(
              color: showDetailColor,
              fontSize: 15.sp,
              fontFamily: 'IBMPlexSans',
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    item = args[StringManager.item];
    isTheOwner = args[StringManager.isTheOwner] ?? false;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: 440.h,
                        child: Image.network(
                          item.imageUrl[0],
                          fit: BoxFit.cover,
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                            return child;
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return loading();
                            }
                          },
                        )),
                  ],
                ),
                Column(
                  children: [
                    (height / 2.1).he,
                    Container(
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(32),
                            topLeft: Radius.circular(32)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: 'IBMPlexSans',
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              infoRow(StringManager.showDetailBedIcon,
                                  "${item.roomsNo}"),
                              infoRow(StringManager.showDetailBathtubIcon,
                                  "${item.bathroomsNo}"),
                              infoRow(StringManager.showDetailStairsIcon,
                                  "${item.floor}"),
                              infoRow(StringManager.showDetailAreaIcon,
                                  "${item.area}${StringManager.areaUnit}"),
                            ],
                          ),
                          20.h.he,
                          userCard(),
                          25.h.he,
                          Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              child: Image.network(
                                  "https://user-images.githubusercontent.com/90563044/215372638-0dca96fa-5e19-4aea-a8cd-57c9eb9c225b.png")),
                          35.h.he,
                          priceRow(),
                          20.h.he,
                          Visibility(
                            visible: isTheOwner,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          StringManager.requestedBy,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontFamily: StringManager.ibmPlexSans,
                                              fontWeight: FontWeight.w500),
                                        )),
                                    const Expanded(flex: 1, child: SizedBox())
                                  ],
                                ),
                                SizedBox(
                                  height: 13.h,
                                ),
                                ListView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  children: [
                                    UserItem(
                                        user: User(
                                            userId: "1",
                                            firstName: "Leo",
                                            secondName: "Messi",
                                            email: "loemessi1234@gmail.com",
                                            phoneNumber: "+201153180577",
                                            longitude: 30.12571871868943,
                                            latitude: 31.70773392993082,
                                            pictureUrl: "https://phantom-marca.unidadeditorial.es/60192032bf2633d55bb044727463ec69/resize/660/f/webp/assets/multimedia/imagenes/2022/11/26/16694993827727.jpg")),
                                    UserItem(
                                        user: User(
                                            userId: "1",
                                            firstName: "Leo",
                                            secondName: "Messi",
                                            email: "loemessi1234@gmail.com",
                                            phoneNumber: "+201153180577",
                                            longitude: 30.12571871868943,
                                            latitude: 31.70773392993082,
                                            pictureUrl: "https://phantom-marca.unidadeditorial.es/60192032bf2633d55bb044727463ec69/resize/660/f/webp/assets/multimedia/imagenes/2022/11/26/16694993827727.jpg")),
                                    UserItem(
                                        user: User(
                                            userId: "1",
                                            firstName: "Leo",
                                            secondName: "Messi",
                                            email: "loemessi1234@gmail.com",
                                            phoneNumber: "+201153180577",
                                            longitude: 30.12571871868943,
                                            latitude: 31.70773392993082,
                                            pictureUrl: "https://phantom-marca.unidadeditorial.es/60192032bf2633d55bb044727463ec69/resize/660/f/webp/assets/multimedia/imagenes/2022/11/26/16694993827727.jpg")),
                                    UserItem(
                                        user: User(
                                            userId: "1",
                                            firstName: "Leo",
                                            secondName: "Messi",
                                            email: "loemessi1234@gmail.com",
                                            phoneNumber: "+201153180577",
                                            longitude: 30.12571871868943,
                                            latitude: 31.70773392993082,
                                            pictureUrl: "https://phantom-marca.unidadeditorial.es/60192032bf2633d55bb044727463ec69/resize/660/f/webp/assets/multimedia/imagenes/2022/11/26/16694993827727.jpg")),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: RoundedBackButton(
                      backgroundColor: shadowColor2,
                      arrowColor: Colors.white,
                      iconSize: 15,
                      onClick: () {
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
