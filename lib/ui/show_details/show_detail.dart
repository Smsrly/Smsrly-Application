import 'package:flutter/material.dart';
import 'package:smsrly/models/realestate.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowDetail extends StatelessWidget {
  late RealEstate item;
  ShowDetail({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        height: 422,
                        child: Image.network(item.imageUrl,fit: BoxFit.cover,)
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 395,),

                    Container(
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      decoration:  const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight:Radius.circular(32) ,topLeft: Radius.circular(32)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title,style: const TextStyle(
                            fontSize: 20, fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 20),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      width:20,
                                      height: 20,
                                      child: Image.asset("images/bed_icon.png"),
                                  ),
                                  const SizedBox(width: 3),
                                  Text("${item.roomsNo}",style: const TextStyle(color: Color.fromRGBO(170, 169, 169, 1)
                                  ,fontSize: 15,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400),),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width:20,
                                    height: 20,
                                    child: Image.asset("images/bathtub_icon.png"),
                                  ),
                                  const SizedBox(width: 3),
                                  Text("${item.bathroomsNo}",style: const TextStyle(color: Color.fromRGBO(170, 169, 169, 1)
                                      ,fontSize: 15,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400),),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width:20,
                                    height: 20,
                                    child: Image.asset("images/stairs_icon.png"),
                                  ),
                                  const SizedBox(width: 3),
                                  Text("${item.floor}",style: const TextStyle(color: Color.fromRGBO(170, 169, 169, 1)
                                      ,fontSize: 15,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400),),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width:20,
                                    height: 20,
                                    child: Image.asset("images/areaa_icon.png"),
                                  ),
                                  const SizedBox(width: 3),
                                  Text("${item.area}m²",style: const TextStyle(color: Color.fromRGBO(170, 169, 169, 1)
                                      ,fontSize: 15,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400),),
                                ],
                              ),

                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color : Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.17),
                                  blurRadius: 50.0,
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(item.owner!= null?item.owner?.pictureUrl as String:"https://user-images.githubusercontent.com/90563044/215369020-31ed45db-baa0-4175-a7ae-c31629fa7fdb.png"),
                                          
                                        ),
                                        const SizedBox(width: 5,),
                                        Text(item.owner!=null?item.owner?.username as String:"Not Found",style: const TextStyle(fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400),)
                                      ],
                                    ),
                                    Visibility(
                                      visible: item.owner != null,
                                      child: InkWell(
                                        child: Container(
                                          margin: const EdgeInsets.all(10),
                                          width: 40,
                                          height: 40,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(14, 82, 137, 0.18),
                                              borderRadius: BorderRadius.circular(13)
                                          ),
                                          child: Image.asset("images/call_icon.png"),

                                        ),
                                        onTap: (){
                                          launch("tel://${item.owner?.phoneNumber}");
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Text(item.description,style: const TextStyle(fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400,),)
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          SizedBox(width: double.infinity,child: Image.network("https://user-images.githubusercontent.com/90563044/215372638-0dca96fa-5e19-4aea-a8cd-57c9eb9c225b.png")),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Latitude: ${item.location.late}",style: const TextStyle(fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400,),),
                              Text("Longitude: ${item.location.long}",style: const TextStyle(fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w400,),),
                            ],
                          ),
                          const SizedBox(height: 35),
                          Row(
                            children: [
                              Expanded(flex: 1,child: Text("${item.price} EGP",textAlign: TextAlign.center,style: const TextStyle(fontSize: 18,fontFamily: 'IBMPlexSans',fontWeight: FontWeight.w500)),),
                              Expanded(flex: 1,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // will add it later
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(14, 82, 137, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
                                      child: Text('Request'),
                                    ),
                                  ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    // will change it later
                  ],
                ),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 0.15),
                        borderRadius: BorderRadius.circular(13)
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
