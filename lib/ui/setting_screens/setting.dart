import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smsrly/ui/setting_screens/contact_us.dart';
import 'package:smsrly/res/strings.dart';
import 'package:smsrly/res/colors.dart';
import 'package:smsrly/utils/helpers/extensions.dart';
import 'package:smsrly/viewmodel/app_view_model.dart';
import '../../utils/routes/route_name.dart';
import '../../viewmodel/tab_viewmodel.dart';
import 'password_dialog.dart';


class Setting extends StatelessWidget {
  const Setting({super.key});


  void showDeleteDialog(BuildContext context){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.topSlide,
      title: StringManager.delete,
      desc:
      StringManager.areYouSure,
      btnCancelOnPress: () => print("Canceled"),
      btnOkOnPress: () => print("Ok"),
    ).show();
  }


  Widget settingRow(String text, IconData icon, VoidCallback onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.sp),
        ),
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: 25.sp,
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    final viewModel = Provider.of<AppViewModel>(context ,listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 45.h, horizontal: 20.w),
                    height: 300.h,
                    decoration: BoxDecoration(
                        color:   primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.sp),
                            bottomRight: Radius.circular(30.sp))),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            size: 40.sp,
                            color: Colors.white,
                          ),
                          10.w.wi,
                          Text(
                            StringManager.setting,
                            style: TextStyle(
                                fontFamily: StringManager.ibmPlexSans,
                                fontWeight: FontWeight.bold,
                                fontSize: 26.sp,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding:
                    EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                    margin:
                    EdgeInsets.only(top: h / 5, right: 20.w, left: 20.w),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: boxShadowColor,
                            blurRadius: 50.0,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.h))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: borderSideColor,
                                  width: 0.4.w,
                                ),
                              )),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: viewModel.currUser!.pictureUrl != null
                                    ? CircleAvatar(
                                  backgroundImage:
                                  NetworkImage(viewModel.currUser!.pictureUrl!),
                                )
                                    : Image.asset(StringManager.profilePlaceholder),
                              ),
                              SizedBox(
                                width: 15.h,
                              ),
                              Text(
                                viewModel.currUser!.username,
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                        ),
                        10.h.he,
                        Row(
                          children: [
                            Text(
                              StringManager.accSetting,
                              style: TextStyle(
                                  color: offWhite ,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20.sp),
                            ),
                          ],
                        ),
                        15.h.he,

                        settingRow(StringManager.edit, Icons.arrow_forward_ios, () {
                          Navigator.of(context).pushNamed(RouteName.editProfileRoute);
                        }),
                        13.h.he,
                        settingRow(StringManager.changePassword, Icons.arrow_forward_ios, () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const PasswordDialog();
                            },
                          );
                        }),
                        13.h.he,
                        // settingRow("Dark Mode", Icons.dark_mode_outlined, () {}),
                        13.h.he,

                        Text(
                          StringManager.more,
                          style: TextStyle(
                              color:offWhite,
                              fontWeight: FontWeight.w300,
                              fontSize: 20.sp),
                        ),

                        13.h.he,
                        settingRow(StringManager.contactUs, Icons.arrow_forward_ios, () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return const ContactUsScreen();
                          }));
                        }),
                        13.h.he,
                        settingRow(StringManager.logOut, Icons.logout, () {
                          viewModel.logout();
                          Navigator.of(context).pushReplacementNamed(RouteName.loginRoute);
                          Provider.of<TabViewModel>(context,listen: false).currentIndex = 0;
                        }),
                        13.h.he,
                        settingRow(StringManager.deleteAccount, Icons.arrow_forward_ios, () {
                          showDeleteDialog(context);
                        }),
                      ],
                    ),
                  ),
                  50.h.he
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
