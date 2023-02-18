import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/ui/explore_screen/options_dialog.dart';

import '../../models/realestate.dart';
import '../../models/user.dart';
import '../show_details/show_detail.dart';
import '../widgets/colors.dart';
import '../widgets/realestates_items/realestate_second_item.dart';

class ExploreScreen extends StatefulWidget {
  late List <RealEstate> items;


  late User user;

  ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late List<RealEstate> _filteredItems;
  var _forRentOrSale=-1;
  var _searchedText="";
  var _filtersList =[
    -1,1000000000000000000,
    -1, 1000000000000000000,
    -1,1000000000000000000,
    -1,1000000000000000000,
    -1,1000000000000000000
  ];
  void showOptionsDialog(var context){
    showDialog(context: context, builder: (context){
      var dialog = OptionsDialog(context: context,forRentOrSale: _forRentOrSale,numbers: _filtersList);
      dialog.onSubmit=(values,forRentOrSale){
        _filtersList=values;
        _forRentOrSale=forRentOrSale;
        _runFilter(_searchedText, _filtersList, _forRentOrSale);
          };
      return dialog;
    });
  }

  void _runFilter(String text, List<int> requirements, int rentOrSale) {
    text = text.toLowerCase().trim();
    List<RealEstate> list = [];

    for (var entry in widget.items) {
      var bool1 = text.isEmpty ||
          entry.city?.toLowerCase().contains(text) as bool;
      var bool2 = text.isEmpty ||
          entry.country?.toLowerCase().contains(text) as bool;
      var bool3 = rentOrSale == -1 || entry.rentOrSale == rentOrSale;
      var bool4 = entry.price >= requirements[0] &&
          entry.price <= requirements[1];
      var bool5 = entry.floor >= requirements[2] &&
          entry.floor <= requirements[3];
      var bool6 = entry.roomsNo >= requirements[4] &&
          entry.roomsNo <= requirements[5];
      var bool7 = entry.bathroomsNo >= requirements[6] &&
          entry.bathroomsNo <= requirements[7];
      var bool8 = entry.area >= requirements[8] &&
          entry.area <= requirements[9];

      if ((bool1 || bool2) &&
          bool3 &&
          bool4 &&
          bool5 &&
          bool6 &&
          bool7 &&
          bool8) {

        list.add(entry);

      }
    }
    setState(() {
      _filteredItems = list;
    });
  }



  Widget searchTextField(){
    return Expanded(
        flex: 1,
        child: Container(
          padding: const EdgeInsets.only(
              top: 3, bottom: 3, left: 13, right: 10),
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromRGBO(0, 0, 0, 0.1)),
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
              SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset("assets/images/search_icon.png")),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  onChanged: (value){
                    _searchedText=value;
                    _runFilter(value,_filtersList,_forRentOrSale);
                  },
                  cursorColor:
                  const Color.fromRGBO(169, 169, 169, 1),
                  style: const TextStyle(
                      color: Color.fromRGBO(96, 96, 96, 1)),
                  decoration: const InputDecoration(
                    hintText: "Where do you want to go",
                    hintStyle: TextStyle(

                        color:
                        Color.fromRGBO(169, 169, 169, 1)),
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ));
  }


  Widget realEstateItem(RealEstate currItem){
    return InkWell(
              child: SecondItem(
                item: currItem,
                hasSaved: widget.user.isSaved(currItem),
                onSaveBtn: () {
                  setState(() {
                    if (widget.user.isSaved(currItem)) {
                      widget.user.unSaveRealEstate(currItem);
                    } else {
                      widget.user.saveRealEstate(currItem);
                    }
                  });
                },
              ),
              onTap: () {
                // go to show detail
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_){
                      return ShowDetail(item: currItem);
                    })
                );
              },
          );
  }


  Widget notFoundWidget(){
    return Visibility(
        visible:_filteredItems.isEmpty,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/notfound_icon.png"),
              const SizedBox(
                height: 10,
              ),
              const Text("Ups!... no results found",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'IBMPlexSans',
                    fontWeight: FontWeight.w500,
                    color: primaryColor)
                ),
              const SizedBox(
                height: 5,
              ),
              const Text("Please try another search",
                style: TextStyle(
                    fontFamily: 'IBMPlexSans',
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(143, 143, 143, 1.0),
                    fontSize: 15
                ),),
            ],
          ),
        )
    );
  }
  @override
  void initState() {
    _filteredItems=widget.items;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(
                  "Explore",
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    searchTextField(),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset("assets/images/options_icon.png")),
                      ),
                      onTap: () {
                        showOptionsDialog(context);
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _filteredItems.length,
                  itemBuilder: (context, index) {
                    RealEstate currItem = _filteredItems[index]!;
                    return realEstateItem(currItem);
                  }),
              const SizedBox(
                height: 15,
              ),

              notFoundWidget(),

              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
