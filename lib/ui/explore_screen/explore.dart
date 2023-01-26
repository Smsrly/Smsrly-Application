import 'package:flutter/material.dart';

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
                      onTap: () {},
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
                  itemCount: widget.items.length!,
                  itemBuilder: (context, index) {
                    RealEstate currItem = widget.items[widget.IDs[index]]!;
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
            ],
          ),
        ),
      ),
    );
  }
}
