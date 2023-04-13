import 'package:flutter/material.dart';

import '../../../models/realestate.dart';


class ThirdItem extends StatelessWidget {
  late RealEstate realEstate;
  late bool isTheOwner;
  late bool hasSaved;
  VoidCallback? onSaveIconSelected;
  ThirdItem({Key? key, required this.realEstate,required this.isTheOwner,required this.hasSaved,this.onSaveIconSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 6,horizontal: 10),
      width: double.infinity,
      height: 220,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
            )
          ],
        borderRadius: BorderRadius.circular(32)
      ),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 220,
            child: Image.network(realEstate.imageUrl[0],
            fit: BoxFit.cover,
            ),

          ),

          Container(
            width: double.infinity,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(begin: Alignment.centerLeft, stops: const [
                  0.1,
                  0.9
                ], colors: [
                  Colors.black.withOpacity(.7),
                  Colors.black.withOpacity(.1)
                ])),
          ),
          Container(
            width: double.infinity,
            height: 220,
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(realEstate.title,style: const TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400),),
                      Visibility(
                        visible: !isTheOwner,
                        child: InkWell(
                          child: Container(
                              margin: const EdgeInsets.all(5),
                              width: 25,
                              height: 30,
                              child: Image.asset(hasSaved?"assets/images/saved_btn.png":"assets/images/save_btn.png")
                          ),
                          onTap: (){
                            onSaveIconSelected!();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(flex: 2,child: SizedBox()),


                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,color: Color.fromRGBO(
                        213, 213, 213, 1),
                    ),
                    Text(realEstate.city != null && realEstate.country!= null?
                    "${realEstate.country}, ${realEstate.city}"
                        :"${realEstate.latitude}, ${realEstate.longitude}",style: const TextStyle(
                      color:
                      Color.fromARGB(
                          255, 188, 188, 188
                      ),
                      fontFamily: "IBMPlexSans",
                      fontWeight: FontWeight.w400,
                    ),)
                  ],
                ),

                const Expanded(flex: 1,child: SizedBox()),
                Row(
                  children: [
                    SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset("assets/images/area_icon_white.png")
                    ),
                    const SizedBox(width: 3,),
                    Text("${realEstate.area}",style: const TextStyle(
                      color:
                      Color.fromRGBO(
                          213, 213, 213, 1
                      ),
                      fontFamily: "IBMPlexSans",
                      fontWeight: FontWeight.w400,
                    ),)
                  ],
                ),
                const Expanded(flex: 1,child: SizedBox()),
                Row(
                  children: [
                    SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset("assets/images/stairs_icon_white.png")
                    ),
                    const SizedBox(width: 3,),
                    Text("${realEstate.floor}",style: const TextStyle(
                      color:
                      Color.fromRGBO(
                          213, 213, 213, 1
                      ),
                      fontFamily: "IBMPlexSans",
                      fontWeight: FontWeight.w400,
                    ),)
                  ],
                ),
                const Expanded(flex: 1,child: SizedBox()),

                Row(
                  children: [
                    SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset("assets/images/bathtub_icon_white.png")
                    ),
                    const SizedBox(width: 3,),
                    Text("${realEstate.bathroomsNo}",style: const TextStyle(
                      color:
                      Color.fromRGBO(
                          213, 213, 213, 1
                      ),
                      fontFamily: "IBMPlexSans",
                      fontWeight: FontWeight.w400,
                    ),)
                  ],
                ),
                const Expanded(flex: 1,child: SizedBox()),

                Row(
                  children: [
                    SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset("assets/images/bed_icon_white.png")
                    ),
                    const SizedBox(width: 3,),
                    Text("${realEstate.roomsNo}",style: const TextStyle(
                      color:
                      Color.fromRGBO(
                          213, 213, 213, 1
                      ),
                      fontFamily: "IBMPlexSans",
                      fontWeight: FontWeight.w400,
                    ),)
                  ],
                ),
                const Expanded(flex: 1,child: SizedBox()),


              ],
            ),
          )
        ],
      ),
    );
  }
}
