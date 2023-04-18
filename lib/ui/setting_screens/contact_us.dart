import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_back_button.dart';
import 'package:smsrly/ui/widgets/buttons/rounded_normal_button.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import 'package:smsrly/viewmodel/contact_us_viewmodel.dart';

import '../widgets/background_with_shadow.dart';

class ContactUsScreen extends StatelessWidget {

  const ContactUsScreen({Key? key}) : super(key: key);



  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  Widget dropDownButton(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DropdownButtonHideUnderline(
          child: Consumer<ContactUsViewModel>(
            builder: (_,viewModel,__){
              return DropdownButton(
                isExpanded: true,
                value: viewModel.value,
                icon: const Icon(Icons.arrow_drop_down_rounded,
                    size: 40, color: Color(0xFF374957)),
                hint: Text(StringManager.yourTrouble, style: TextStyle(
                    fontSize: 16.sp, fontFamily: StringManager.ibmPlexSans,
                    fontWeight: FontWeight.w500),),
                borderRadius: BorderRadius.circular(20),
                items: viewModel.problems.map(buildMenuItem).toList(),
                onChanged: (value) {
                  viewModel.value = value;
                  /*
              setState(() {
                this.value = value;
              });
               */
                },
              );
            },
          )
        )
    );
  }

  Widget messageTextField(Function(String) onChange){
    return TextField(
            cursorColor:
            const Color.fromRGBO(169, 169, 169, 1),
            maxLines: 6,
            onChanged: onChange,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18.0),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(216, 216, 216, 0.9),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18.0),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(216, 216, 216, 0.44),
                  width: 1,
                ),
              ),
            ),
          );
  }

  Widget attachPictureRow(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(StringManager.attach,style: TextStyle(
                fontSize: 16.sp,
                fontFamily: StringManager.ibmPlexSans,
                fontWeight: FontWeight.w500
            ),),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Image(
              image: AssetImage(StringManager.attachPic),
              width: 25,
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ContactUsViewModel>(context,listen: false);
    return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h,horizontal:5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RoundedBackButton(
                        backgroundColor: const Color.fromRGBO(135, 169, 197, 0.35),
                        arrowColor: const Color.fromRGBO(0, 0, 0, 0.5),
                        iconSize: 16,
                        onClick: () {
                          Navigator.pop(context);
                        }
                    ),
                    SizedBox(height: 23.h,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(StringManager.getInTouch,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 25.sp)),
                          ),
                          SizedBox(height: 5.h,),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              StringManager.paragraph,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: StringManager.ibmPlexSans,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          23.h.he,

                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              StringManager.question,
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.black54, fontSize: 16.sp
                              ,fontFamily: StringManager.ibmPlexSans,
                                fontWeight: FontWeight.w500,),
                            ),
                          ),

                          15.h.he,

                          ContainerWithShadow(
                            padding: const EdgeInsets.only(
                                top: 3, bottom: 3, left: 13, right: 10),
                              width: double.infinity,
                              child: dropDownButton()
                          ),

                          SizedBox(height: 23.h,),

                          SizedBox(
                              width: double.infinity,
                              child:Text(
                                StringManager.yourMessage,
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black54, fontSize: 16.sp
                                  ,fontFamily: StringManager.ibmPlexSans,
                                  fontWeight: FontWeight.w500,),
                              ),),
                          15.h.he,

                          ContainerWithShadow(
                              width: double.infinity,
                              child: messageTextField(
                                  (value){
                                    viewModel.message = value;
                                  }
                              )
                          ),
                          18.h.he,
                          InkWell(
                            child: ContainerWithShadow(
                                width: double.infinity,height: 56,
                                child: attachPictureRow()
                            ),
                            onTap: () async {
                              final image = await ImagePicker.platform
                                  .pickImage(source: ImageSource.gallery);
                              viewModel.image = image;
                            },
                          ),
                          35.h.he,
                          SizedBox(
                            width:double.infinity,
                            child: RoundedButton(
                              text: StringManager.send,
                              onClick: (){
                                viewModel.sendMessage();
                            },)
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
