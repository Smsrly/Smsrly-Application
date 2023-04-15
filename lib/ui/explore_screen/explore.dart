import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/res/dimen.dart';
import 'package:smsrly/res/styles.dart';
import 'package:smsrly/ui/explore_screen/options_dialog.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import 'package:smsrly/viewmodel/app_view_model.dart';
import 'package:smsrly/viewmodel/explore_viewmodel.dart';

import '../../models/realestate.dart';
import '../../res/colors.dart';
import '../widgets/realestates_items/realestate_second_item.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);


  void showOptionsDialog(var context) {
    showDialog(
        context: context,
        builder: (context) {
          var dialog = OptionsDialog();
          return dialog;
        });
  }

  Widget searchTextField(ExploreViewModel viewModel) {
    return Expanded(
        flex: 1,
        child: Container(
          padding: Dimensions.explorePadding,
          decoration: BoxDecoration(
            border: Border.all(color: shadowColor),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: boxShadowColor,
                blurRadius: 50.0,
              )
            ],
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset(StringManager.searchImage)),
              ),
              10.he,
              Expanded(
                flex: 1,
                child: TextFormField(
                  onChanged: (value) {
                    viewModel.searchedText = value;
                  },
                  cursorColor: searchCursorColor,
                  style: const TextStyle(color: searchTextColor),
                  decoration: const InputDecoration(
                    hintText: StringManager.where,
                    hintStyle: TextStyle(color: searchHintColor),
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget realEstateItem(RealEstate currItem) {
    return InkWell(
      child: SecondItem(
        item: currItem,
        saveButton: Consumer<ExploreViewModel>(
          builder: (_,viewModel,__){
            return InkWell(
              onTap: () {
                viewModel.toggleRealEstate(currItem);
              },
              child: Image.asset(currItem.hasSaved ?? false
                  ? StringManager.savedIconBlue
                  : StringManager.unSaveIconBlue),
            );
          },
        )
      ),
      onTap: () {
        // go to show detail
      },
    );
  }

  Widget notFoundWidget() {
    return Consumer<ExploreViewModel>(
        builder: (_,viewModel,__){
          return Visibility(
              visible: viewModel.realEstates.isEmpty, //_filteredItems.isEmpty,
              child: Container(
                width: double.infinity,
                padding: Dimensions.notFoundImage,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(StringManager.notFoundImagePath),
                    10.he,
                    Text(
                      StringManager.ups,
                      style: AppStyles.headline2,
                    ),
                    5.he,
                    Text(
                      StringManager.please,
                      style: AppStyles.bodyText4,
                    ),
                  ],
                ),
              ));
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ExploreViewModel>(context, listen: false);
    viewModel.realEstates =
        Provider.of<AppViewModel>(context, listen: false).realEstateItems;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              15.h.he,
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(
                  StringManager.explore,
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              15.h.he,
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    searchTextField(viewModel),
                    8.he,
                    Container(
                      margin: const EdgeInsets.only(left: 5, right: 3),
                      child: InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(16)),
                          child: SizedBox(
                              width: 20,
                              height: 20,
                              child: Image.asset(
                                  StringManager.optionIconImagePath)),
                        ),
                        onTap: () {
                          showOptionsDialog(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              20.he,
              Consumer<ExploreViewModel>(
                builder: (_, viewModel, __) {
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: viewModel.realEstates.length,
                      // _filteredItems.length,
                      itemBuilder: (context, index) {
                        RealEstate currItem = viewModel.realEstates[index];
                        return realEstateItem(currItem);
                      });
                },
              ),
              15.he,
              notFoundWidget(),
              10.he,
            ],
          ),
        ),
      ),
    );
  }
}
