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
  ExploreScreen({Key? key}) : super(key: key);

  /*
  var _forRentOrSale=-1;

  var _searchedText="";

  var _filtersList =[
    -1,1000000000000000000,
    -1, 1000000000000000000,
    -1,1000000000000000000,
    -1,1000000000000000000,
    -1,1000000000000000000
  ];

   */

  void showOptionsDialog(var context) {
    showDialog(
        context: context,
        builder: (context) {
          var dialog = OptionsDialog();
          return dialog;
        });
  }

  void _runFilter(String text, List<int> requirements, int rentOrSale) {
    text = text.toLowerCase().trim();
    List<RealEstate> list = [];

    // for (var entry in widget.items) {
    //   var bool1 = text.isEmpty ||
    //       entry.city?.toLowerCase().contains(text) as bool;
    //   var bool2 = text.isEmpty ||
    //       entry.country?.toLowerCase().contains(text) as bool;
    //   var bool3 = rentOrSale == -1 || entry.rentOrSale == rentOrSale;
    //   var bool4 = entry.price >= requirements[0] &&
    //       entry.price <= requirements[1];
    //   var bool5 = entry.floor >= requirements[2] &&
    //       entry.floor <= requirements[3];
    //   var bool6 = entry.roomsNo >= requirements[4] &&
    //       entry.roomsNo <= requirements[5];
    //   var bool7 = entry.bathroomsNo >= requirements[6] &&
    //       entry.bathroomsNo <= requirements[7];
    //   var bool8 = entry.area >= requirements[8] &&
    //       entry.area <= requirements[9];
    //
    //   if ((bool1 || bool2) &&
    //       bool3 &&
    //       bool4 &&
    //       bool5 &&
    //       bool6 &&
    //       bool7 &&
    //       bool8) {
    //
    //     list.add(entry);
    //
    //   }
    // }
    /*
      setState(() {
        _filteredItems = list;
      });

     */
  }

  Widget searchTextField() {
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
                    /*
                    _searchedText=value;
                    _runFilter(value,_filtersList,_forRentOrSale);
                     */
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
                    searchTextField(),
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
