import 'package:flutter/material.dart';
import 'package:smsrly/models/realestate.dart';

class SecondItem extends StatefulWidget {
  late RealEstate item;
  late bool hasSaved;
  VoidCallback? onSaveBtn;
  SecondItem({Key? key, required this.item, required this.hasSaved, required this.onSaveBtn}) : super(key: key);

  @override
  State<SecondItem> createState() => _SecondItemState();
}

class _SecondItemState extends State<SecondItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      height: 130,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Colors.white,
        elevation: 25,
        child: SizedBox(
          height: 130,
          child: Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  width: 120,
                  height: 130,
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.item.imageUrl),
                ),
              ),
              const Expanded(flex: 2, child: SizedBox()),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.item.title,
                      style: const TextStyle(
                          fontSize: 17, fontFamily: "IBMPlexSans",
                          fontWeight: FontWeight.w400,
                      )),
                  Row(
                    children: [
                      SizedBox(
                          width: 12,
                          height: 16,
                          child: Image.asset("images/black_location_icon.png")),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(widget.item.locationText ?? "${widget.item.location.late}, ${widget.item.location.long}",
                          style: const TextStyle(
                              fontFamily: "IBMPlexSans",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Color.fromRGBO(103, 103, 103, 1))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 20,
                          height: 20,
                          child: Image.asset("images/area_icon.png")),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${widget.item.area} m²",
                        style: const TextStyle(
                            fontFamily: "IBMPlexSans",
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color.fromRGBO(103, 103, 103, 1)),
                      ),
                    ],
                  ),
                  Text("${widget.item.price} EGP",
                      style: const TextStyle(
                          fontFamily: "IBMPlexSans",
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Color.fromRGBO(14, 82, 137, 1))),
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
                        child: Image.asset(widget.hasSaved?"images/saved_icon_blue.png":"images/save_icon_blue.png"),
                        onTap:(){
                          widget.onSaveBtn!();
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
