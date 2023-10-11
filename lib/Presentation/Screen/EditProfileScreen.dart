import 'package:flutter/material.dart';
import 'package:lask/Data/Controller/EditProfileController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lask/Data/Controller/SharedPreferences.dart';

import '../../Package/Constants.dart';
import '../../Package/CustomePadding.dart';
import '../../Package/CustomeTexts.dart';
import '../../Package/ElevatedButton.dart';
import '../../Package/RippleEffectContainer.dart';
import '../../Package/ScrollColorRemove.dart';
import '../../Package/TextFormFeilds.dart';
import '../Constants.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  ScrollController controller = ScrollController();
  EditProfileController eController = EditProfileController();
  SharedPreference pref = Get.find<SharedPreference>();

  validation() {
    if (eController.formKey.currentState!.validate()) {
      eController.updateDetails(pref.u_doc.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ScrollColorRemove(
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('lask_news_app')
                .doc(pref.u_doc.value)
                .get(),
            builder: (context, snapshot) {
              print('@@@@@@New Request');
              if (snapshot.hasError) {
                print("Error");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapshot.data!.data();
              var name = data!['name'];
              var email = data['email'];
              var mobile = data['mobilenumber'];
              var image = data['img'];
              print('!!!!!!!!!!!!!!!!!${image}');
              eController.changeName(name);
              eController.changeEmail(email);
              eController.changeMobile(mobile);
              return CP(
                  h: 16,
                  child: SizedBox(
                      height: DP.infinity(context),
                      width: DP.infinity(context),
                      child: Column(children: [
                        sizeH(45),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Nav.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back)),
                            TextFW600(
                              text: 'Edit Profile',
                              fontSize: 18,
                              textcolor: textColorMain,
                            ),
                            IconButton(
                                onPressed: null,
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: white,
                                ))
                          ],
                        ),
                        sizeH25(),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Form(
                              key: eController.formKey,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Stack(
                                        children: [
                                          ClickEffect(
                                            onTap: () {},
                                            rippleColor: themeColor,
                                            borderRadius: radius(60),
                                            child: CircleAvatar(
                                              radius: 60,
                                              backgroundColor: white,
                                              child: Image.network(image),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            left: 85,
                                            child: ClickEffect(
                                              onTap: () {},
                                              borderRadius: radius(60),
                                              child: CircleAvatar(
                                                backgroundColor: themeColor,
                                                radius: 15,
                                                child: Icon(
                                                  Icons.camera_enhance,
                                                  size: 18,
                                                  color: white,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const TextFW500(text: 'Name', fontSize: 16),
                                    sizeH10(),
                                    InitialTextFFeild(
                                        textInputAction: TextInputAction.next,
                                        focus: false,
                                        hintText: "Enter your Email",
                                        mainColor: black,
                                        textInputType: TextInputType.text,
                                        obsecureText: false,
                                        initialValue: name,
                                        onChanged: (String val) {
                                          eController.changeName(val);
                                        },
                                        funValidate: (val) {
                                          if (val != null && val.isEmpty) {
                                            return "Name required";
                                          }
                                          return null;
                                        },
                                        borderRadius: 10,
                                        border: true,
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            color: blackO_30)),
                                    sizeH25(),
                                    const TextFW500(
                                        text: 'Email', fontSize: 16),
                                    sizeH10(),
                                    InitialTextFFeild(
                                        textInputAction: TextInputAction.next,
                                        focus: false,
                                        hintText: "Enter your Email",
                                        mainColor: black,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        obsecureText: false,
                                        initialValue: email,
                                        onChanged: (String val) {
                                          eController.changeEmail(val);
                                        },
                                        funValidate: (val) {
                                          if (val != null && val.isEmpty) {
                                            return "Email required";
                                          } else if (val != null &&
                                              !GetUtils.isEmail(val)) {
                                            return "Invalid Email";
                                          }
                                          return null;
                                        },
                                        borderRadius: 10,
                                        border: true,
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            color: blackO_30)),
                                    sizeH25(),
                                    const TextFW500(
                                        text: 'Mobile Number', fontSize: 16),
                                    sizeH10(),
                                    InitialTextFFeild(
                                        textInputAction: TextInputAction.next,
                                        focus: false,
                                        hintText: "Enter your Email",
                                        mainColor: black,
                                        textInputType: TextInputType.number,
                                        obsecureText: false,
                                        initialValue: mobile,
                                        length: 10,
                                        maxLines: 1,
                                        funValidate: (val) {
                                          if (val != null && val.isEmpty) {
                                            return "Mobile Number required";
                                          } else if (val != null &&
                                              val.length != 10) {
                                            return "Mobile Number must be 10 digits.";
                                          }
                                          return null;
                                        },
                                        onChanged: (String val) {
                                          eController.changeMobile(val);
                                        },
                                        borderRadius: 10,
                                        border: true,
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            color: blackO_30)),
                                    sizeH(50),
                                  ]),
                            ),
                          ),
                        ),
                        CP(
                          v: 16,
                          child: Visibility(
                              visible:
                                  MediaQuery.of(context).viewInsets.bottom == 0,
                              child: CustomButton(
                                onPress: () {
                                  validation();
                                },
                                radius: 10,
                                height: 48,
                                width: DP.infinity(context),
                                label: "UPDATE PROFILE DETAILS",
                                bgcolor: themeColor,
                                txtcolor: white,
                                weight: FontWeight.w500,
                                size: 18,
                              )),
                        )
                      ])));
            }),
      ),
    );
  }
}

class AddressItem extends StatelessWidget {
  const AddressItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onEdit,
      required this.onDelete});
  final String title;
  final String subtitle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: textColor3, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFW500(
                  fontFamily: 'poppins',
                  text: title,
                  fontSize: 16,
                  textcolor: textColor1,
                  fontWeight: FontWeight.w600,
                ),
                TextFW500(
                  fontFamily: 'poppins',
                  text: subtitle,
                  fontSize: 16,
                  textcolor: textColor1,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          sizeW10(),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: themeColor,
                radius: 22,
                child: IconButton(
                  onPressed: onEdit,
                  icon: Icon(
                    Icons.edit_outlined,
                    color: white,
                    size: 25,
                  ),
                ),
              ),
              sizeW10(),
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.orange,
                child: IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete_outline_outlined,
                    color: white,
                    size: 25,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
