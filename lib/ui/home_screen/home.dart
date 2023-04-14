import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/models/owner_info.dart';
import 'package:smsrly/res/styles.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/res/colors.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import 'package:smsrly/viewmodel/app_view_model.dart';

import '../../models/realestate.dart';
import '../../utils/routes/route_name.dart';
import '../widgets/realestates_items/realestate_first_item.dart';
import '../widgets/realestates_items/realestate_second_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  Widget header(AppViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                StringManager.welcome,
                style: TextStyle(fontSize: 13, color: welcomeMessageColor),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                viewModel.currUser!.firstName,
                style: AppStyles.getBodyText2(primaryColor),
              )
            ],
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: viewModel.currUser!.pictureUrl != null
                ? CircleAvatar(
                    backgroundImage:
                        NetworkImage(viewModel.currUser!.pictureUrl!),
                  )
                : Image.asset(StringManager.profilePlaceholder),
          ),
        ],
      ),
    );
  }

  Widget seeAllRow(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                StringManager.see,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: homeTextColor),
              ))
        ],
      ),
    );
  }

  Widget firstItem(RealEstate currItem, BuildContext context) {
    return InkWell(
      child: FirstItem(
        item: currItem,
        hasSaved: currItem.hasSaved??false,
        onSaveIconSelected: () {},
      ),
      onTap: () {
        // go to show detail
        Navigator.pushNamed(context, RouteName.showDetailsRoute,
            arguments: {StringManager.item: currItem});
      },
    );
  }

  Widget secondItem(RealEstate currItem, BuildContext context) {
    return InkWell(
      child: SecondItem(
        item: currItem,
        hasSaved: currItem.hasSaved??false,
        onSaveBtn: () {},
      ),
      onTap: () {
        // go to show details
        Navigator.pushNamed(context, RouteName.showDetailsRoute,
            arguments: {StringManager.item: currItem});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AppViewModel>(context, listen: false);
    print('pictureURL => ${viewModel.currUser!.pictureUrl}');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(viewModel),
              10.h.he,
              seeAllRow(StringManager.common),
              SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: viewModel.realEstateItems.length~/3, // widget.items.length~/3
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return firstItem(
                        viewModel.realEstateItems[index]
                          ,context);
                    },
                  )),
              seeAllRow(StringManager.more),
              SizedBox(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: viewModel.realEstateItems.length - viewModel.realEstateItems.length~/3,
                    // widget.items.length - widget.items.length~/3
                    itemBuilder: (context, index) {
                      int currIndex = index + viewModel.realEstateItems.length~/3;
                      RealEstate currItem= viewModel.realEstateItems[currIndex];
                      return secondItem(
                          currItem,
                          context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
