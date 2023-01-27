import 'package:flutter/material.dart';
import 'package:smsrly/ui/explore_screen/options_dialog.dart';

import '../../models/realestate.dart';
import '../../models/user.dart';
import '../realestates_items/realestate_second_item.dart';

class ExploreScreen extends StatefulWidget {
  late Map<int, RealEstate> items;
  late List<int> IDs;


  late User user;

  ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late Map<int, RealEstate> _filteredItems;
  late List<int> _filteredIDs;

  void showOptionsDialog(var context){
    showDialog(context: context, builder: (context){
      var dialog = OptionsDialog(context: context);
      return dialog;
    });
  }
  void _runFilter(String text){
    text=text.toLowerCase().trim();
    Map<int, RealEstate> map ={};
    List<int> list =[];
    print('asdas');
    if(text.isEmpty){
      map=widget.items;
      list=widget.IDs;
    }else{
      for(var entry in widget.items.entries){
        var bool1 = entry.value.city?.toLowerCase().contains(text);
        var bool2 = entry.value.country?.toLowerCase().contains(text);
        print('$bool1 $bool2');
        if(bool1! || bool2!){
          list.add(entry.key);
          map[entry.key] = entry.value;
        }
      }
    }
    print('list length: ${list.length} , map length: ${map.length}');
    setState(() {
      _filteredIDs=list;
      _filteredItems=map;
    });
  }
  @override
  void initState() {
    _filteredItems=widget.items;
    _filteredIDs=widget.IDs;
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
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.all(9.0),
                child: Text(
                  "Explore",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
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
                                color: Color.fromRGBO(0, 0, 0, 0.15),
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
                                  child: Image.asset("images/search_icon.png")),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  onChanged: (value)=>_runFilter(value),
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
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(14, 122, 209, 1),
                            borderRadius: BorderRadius.circular(16)),
                        child: SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset("images/options_icon.png")),
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
                  itemCount: _filteredItems.length!,
                  itemBuilder: (context, index) {
                    RealEstate currItem = _filteredItems[_filteredIDs[index]]!;
                    return InkWell(
                      child: SecondItem(
                        item: currItem,
                        hasSaved: widget.user.isSaved(currItem),
                        onSaveBtn: () {
                          setState(() {
                            print(currItem.realEstateId);
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
                      },
                    );
                  }),
              const SizedBox(
                height: 15,
              ),
              Visibility(
                  visible:_filteredIDs.isEmpty,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Image.asset("images/notfound_icon.png"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Ups!... no results found",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'IBMPlexSans',
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(14, 82, 137, 1)
                        ),),
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
              ),
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
