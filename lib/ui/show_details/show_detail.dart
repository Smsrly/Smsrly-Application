import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/res/colors.dart';
import 'package:smsrly/res/styles.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_back_button.dart';
import 'package:smsrly/ui/widgets/user_items/user_item.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import 'package:smsrly/viewmodel/ads_viewmodel.dart';
import 'package:smsrly/viewmodel/details_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../models/realestate.dart';
import '../../models/user.dart';
import '../../res/strings.dart';

class ShowDetailsScreen extends StatelessWidget {

  const ShowDetailsScreen({Key? key}) : super(key: key);

  Widget priceRow(DetailsViewModel viewModel,BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text("${viewModel.currRealEstate?.price} ${StringManager.egyptianPound}",
              textAlign: TextAlign.center,
              style: AppStyles.bodyText5),
        ),
        5.he,
        Expanded(
          flex: 1,
          child: Consumer<DetailsViewModel>(
            builder: (_,detailsViewMode,__){
              return ElevatedButton(
                onPressed: viewModel.isTheOwner
                    ? () {
                  detailsViewMode.deleteRealEstate();
                  Navigator.pop(context);
                }
                    : () {
                  detailsViewMode.toggleRequest();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: detailsViewMode.statue != StringManager.request
                      ? redColor
                      : primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric( vertical: 20),
                  child: Text(
                    detailsViewMode.statue,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              );
            },
          )
        ),
      ],
    );
  }

  Widget userCard(DetailsViewModel viewModel) {

    String? imageUrl;
    String phoneNumber;
    String name;

    if(viewModel.isTheOwner){
      imageUrl = viewModel.currUser!.pictureUrl;
      phoneNumber = viewModel.currUser!.phoneNumber;
      name = viewModel.currUser!.username;
    } else {
      imageUrl = viewModel.currRealEstate!.ownerInfo!.imageUrl;
      phoneNumber = viewModel.currRealEstate!.ownerInfo!.phoneNumber;
      name = viewModel.currRealEstate!.ownerInfo!.name;
    }
    Widget picture;
    if(imageUrl == null){
      picture = const CircleAvatar(
        backgroundImage:AssetImage(StringManager.profilePlaceholder) ,
      );
    } else {
      picture = CircleAvatar(
        backgroundImage: NetworkImage(
            imageUrl),
      );
    }
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
            visible: !viewModel.isTheOwner,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    picture,
                    5.w.wi,
                    Text(
                      name,
                      style: const TextStyle(
                          fontFamily: StringManager.ibmPlexSans,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Visibility(
                  visible: !viewModel.isTheOwner,
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
                      launch("tel://$phoneNumber");
                    },
                  ),
                ),
              ],
            ),
          ),
          2.h.he,
          Text(
            viewModel.currRealEstate!.description,
            style: const TextStyle(
              fontFamily: StringManager.ibmPlexSans,
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
              fontFamily: StringManager.ibmPlexSans,
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
    RealEstate item = args[StringManager.item];
    final viewModel = Provider.of<DetailsViewModel>(context,listen: false);
    viewModel.currRealEstate = item;
    viewModel.isTheOwner = args[StringManager.isTheOwner] ?? false;
    print('jiuyt');
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: primaryColor,
          onRefresh: () async {
            viewModel.onRefresh();
          },
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
                            20.h.he,
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
                            userCard(viewModel),
                            25.h.he,
                            /*
                            Image.asset(
                            width: 60.w,
                            height: 60.h,
                            fit: BoxFit.cover,
                            StringManager.profilePlaceholder)
                             */
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: double.infinity,
                                child: Image.network(
                                    "https://user-images.githubusercontent.com/90563044/215372638-0dca96fa-5e19-4aea-a8cd-57c9eb9c225b.png")
                            ),
                            35.h.he,
                            priceRow(viewModel,context),
                            20.h.he,
                            Visibility(
                              visible: viewModel.isTheOwner,
                              child: Consumer<DetailsViewModel>(
                                builder: (_,detailsViewModel,__){
                                  return Column(
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
                                      13.h.he,
                                      if(detailsViewModel.isTheOwner)
                                        if(detailsViewModel.currRealEstate!.requestedBy!.isNotEmpty)
                                          ListView.builder(
                                              physics: const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: detailsViewModel.currRealEstate!.requestedBy!.length,
                                              itemBuilder: (ctx, index){
                                                String? imageUrl;
                                                String phoneNumber;
                                                String name;
                                                print('befffore');
                                                if(detailsViewModel.isTheOwner){
                                                  imageUrl = detailsViewModel.currUser!.pictureUrl;
                                                  phoneNumber = detailsViewModel.currUser!.phoneNumber;
                                                  name = detailsViewModel.currUser!.username;
                                                } else {
                                                  imageUrl = detailsViewModel.currRealEstate!.ownerInfo!.imageUrl;
                                                  phoneNumber = detailsViewModel.currRealEstate!.ownerInfo!.phoneNumber;
                                                  name = detailsViewModel.currRealEstate!.ownerInfo!.name;
                                                }
                                                print('afffter');
                                                return UserItem(name: name , phoneNumber: phoneNumber,imageUrl: imageUrl,);
                                              }
                                          )
                                        else
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              20.he,
                                              Text(
                                                StringManager.noRequestMessageTitle,
                                                style: AppStyles.headline7,
                                              ),
                                              15.he,
                                              Text(
                                                StringManager.noRequestMessageBody,
                                                style: AppStyles.bodyText4,
                                              ),
                                            ],
                                          )
                                    ],
                                  );
                                },
                              )
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
      ),
    );
  }
}
