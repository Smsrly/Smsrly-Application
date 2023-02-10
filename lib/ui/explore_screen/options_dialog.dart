import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionsDialog extends StatefulWidget {
  late BuildContext context;
  late List<int> numbers;
  late void Function(List<int>,int) onSubmit;
  var forRentOrSale=-1;
  OptionsDialog({Key? key,required this.context,required this.forRentOrSale,required this.numbers}) : super(key: key);

  @override
  State<OptionsDialog> createState() => _OptionsDialogState();
}

class _OptionsDialogState extends State<OptionsDialog> {
  var _forRentOrSale=-1;
  final List<TextEditingController> _controllers=[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()

  ];
  @override
  void initState() {
    _forRentOrSale=widget.forRentOrSale;
    for(int i=0; i<widget.numbers.length;i++){
      _controllers[i].text=widget.numbers[i]!=1000000000000000000 && widget.numbers[i]!=-1?"${widget.numbers[i]}":"";
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      child: SizedBox(
        width: double.infinity,
        height: 500,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                          child: Text("Filters",style: TextStyle(
                              fontSize: 25.sp,
                              fontFamily: "IBMPlexSans",
                              fontWeight: FontWeight.w500,
                              ),)),
                      IconButton(onPressed: (){
                        Navigator.pop(context,false);

                      }
                          , icon: const Icon(Icons.close))
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10  ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: _forRentOrSale==-1?const Color.fromRGBO(14, 82, 137, 1):Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(width: 2, color:const Color.fromRGBO(14, 82, 137, 1)),
                                  ),
                                  child: Center(
                                    child: Text("All",style:
                                      TextStyle(
                                          fontFamily: 'IBMPlexSans',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp.sp,
                                          color: _forRentOrSale==-1?Colors.white:const Color.fromRGBO(14, 82, 137, 1)
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: (){
                                  setState(() {
                                    _forRentOrSale=-1;
                                  });
                                },
                              ),
                            ),

                            const SizedBox(width: 8,),

                            Expanded(
                              flex: 1,
                              child: InkWell(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),

                                  decoration: BoxDecoration(
                                    color: _forRentOrSale==1?const Color.fromRGBO(14, 82, 137, 1):Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(width: 2, color: const Color.fromRGBO(14, 82, 137, 1)),
                                  ),
                                  child: Center(
                                    child: Text("For Sale",style:
                                    TextStyle(
                                        fontFamily: 'IBMPlexSans',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp.sp,
                                        color: _forRentOrSale==1?Colors.white:const Color.fromRGBO(14, 82, 137, 1)
                                    ),
                                    ),
                                  ),
                                ),
                                onTap: (){
                                  setState(() {
                                    _forRentOrSale=1;
                                  });
                                },
                              ),
                            ),

                            const SizedBox(width: 8,),

                            Expanded(
                              flex: 1,
                              child: InkWell(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: _forRentOrSale==0?const Color.fromRGBO(14, 82, 137, 1):Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(width: 2, color: const Color.fromRGBO(14, 82, 137, 1)),
                                  ),
                                  child: Center(
                                    child: Text("For Rent",style:
                                    TextStyle(
                                        fontSize: 16.sp.sp,
                                        fontFamily: 'IBMPlexSans',
                                        fontWeight: FontWeight.w400,
                                        color: _forRentOrSale==0?Colors.white:const Color.fromRGBO(14, 82, 137, 1)
                                    ),
                                    ),
                                  ),
                                ),
                                onTap: (){
                                  setState(() {
                                    _forRentOrSale=0;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Text("Price Range",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16.sp.sp,
                            fontFamily: 'IBMPlexSans',
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children:  [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: _controllers[0],
                                cursorColor: const Color.fromRGBO(170, 171, 170,1),
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                decoration:  InputDecoration(
                                  labelText: "Min",

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(14, 82, 137, 1),
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(170, 171, 170,1),
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                cursorColor: const Color.fromRGBO(170, 171, 170,1),
                                keyboardType: TextInputType.number,
                                controller: _controllers[1],

                                decoration:  InputDecoration(
                                  labelText: "Max",

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(14, 82, 137, 1),
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(170, 171, 170,1),
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),


                        const SizedBox(height: 15,),
                        Text("Floors Number",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'IBMPlexSans',
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children:  [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                cursorColor: const Color.fromRGBO(170, 171, 170,1),
                                controller: _controllers[2],
                                decoration:  InputDecoration(
                                  labelText: "Min",

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(14, 82, 137, 1),
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(170, 171, 170,1),
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                cursorColor: const Color.fromRGBO(170, 171, 170,1),
                                controller: _controllers[3],
                                decoration:  InputDecoration(
                                  labelText: "Max",

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(14, 82, 137, 1),
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(170, 171, 170,1),
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),



                        const SizedBox(height: 15,),
                        Text("Rooms Number",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'IBMPlexSans',
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children:  [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                cursorColor: const Color.fromRGBO(170, 171, 170,1),
                                controller: _controllers[4],
                                decoration:  InputDecoration(
                                  labelText: "Min",

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(14, 82, 137, 1),
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(170, 171, 170,1),
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                cursorColor: const Color.fromRGBO(170, 171, 170,1),
                                controller: _controllers[5],
                                decoration:  InputDecoration(
                                  labelText: "Max",

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(14, 82, 137, 1),
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(170, 171, 170,1),
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),



                        const SizedBox(height: 15,),
                        Text("Bathrooms",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'IBMPlexSans',
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children:  [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                cursorColor: const Color.fromRGBO(170, 171, 170,1),
                                controller: _controllers[6],
                                decoration:  InputDecoration(
                                  labelText: "Min",

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(14, 82, 137, 1),
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(170, 171, 170,1),
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                cursorColor: const Color.fromRGBO(170, 171, 170,1),
                                controller: _controllers[7],
                                decoration:  InputDecoration(
                                  labelText: "Max",

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(14, 82, 137, 1),
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(170, 171, 170,1),
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),



                        const SizedBox(height: 15,),
                        Text("Area Range",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'IBMPlexSans',
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children:  [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                cursorColor: const Color.fromRGBO(170, 171, 170,1),
                                controller: _controllers[8],
                                decoration:  InputDecoration(
                                  labelText: "Min",

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(14, 82, 137, 1),
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(170, 171, 170,1),
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                cursorColor: const Color.fromRGBO(170, 171, 170,1),
                                controller: _controllers[9],
                                decoration:  InputDecoration(
                                  labelText: "Max",

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(14, 82, 137, 1),
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                      color:Color.fromRGBO(170, 171, 170,1),
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
              child:
                  SizedBox(
                    width:double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        List<int> list =[];
                        for(var i =0; i<_controllers.length;i++){
                          if(_controllers[i].text.isEmpty){
                            list.add(i%2==0?-1:1000000000000000000);
                          }else{
                            list.add(int.parse(_controllers[i].text.trim()));
                          }
                        }
                    widget.onSubmit(list,_forRentOrSale);
                        Navigator.pop(context,false);

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(14, 82, 137, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text('Submit'),
                      ),
                    ),
                  ),
            ),
            const SizedBox(height: 15),

          ],
        ),
      ),
    );
  }
}