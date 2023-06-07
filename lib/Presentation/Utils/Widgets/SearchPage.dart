import 'package:flutter/material.dart';
import 'package:lask/Package/CustomePadding.dart';
import 'package:lask/Package/CustomeTexts.dart';
import 'package:lask/Package/TextFormFeilds.dart';
import 'package:lask/Presentation/Constants.dart';
import 'package:lask/Presentation/Screen/SearchResult.dart';

import '../../../Package/Constants.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DP.infinity(context),
      width: DP.infinity(context),
      child: Column(
        children: [
          sizeH(45),
          Row(
            children: [
              sizeW(16),
              Expanded(
                child: TextFFeild(
                  border: true,
                  focus: true,
                  mainColor: blue,
                  hintText: 'Search Here...',
                  textInputType: TextInputType.text,
                  length: 10,
                  obsecureText: false,
                  borderRadius: 8,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  prifixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SearchResult()));
                      },
                      icon: Icon(
                        Icons.search,
                        color: black,
                      )),
                  suffixIconData: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.grey.shade300,
                      )),
                  // controller: mobileNumberController,
                  hintStyle: const TextStyle(),
                  funValidate: (val) {
                    if (val != null && val.isEmpty) {
                      return "Please Enter 10 digit Mobile Number";
                    } else if (val != null && val.length != 10) {
                      return "Please Enter 10 digit Mobile Number";
                    }
                    return null;
                  },
                ),
              ),
              // sizeW10(),
              SizedBox(
                width: 70,
                child: IconButton(
                    onPressed: () {
                      Nav.pop(context);
                      unfocus();
                    },
                    icon: TextFW500(
                      text: 'Cancel',
                      fontSize: 14,
                      textcolor: themeColor,
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CP(
      h: 16,
      child: Row(
        children: [
          sizeH(45),
          Row(
            children: [
              TextFFeild(
                border: true,
                focus: true,
                mainColor: Colors.red,
                labelText: "Enter Mobile Number",
                textInputType: TextInputType.number,
                length: 10,
                obsecureText: false,
                borderRadius: 8,
                prifixIcon: const Icon(Icons.search),
                suffixIconData: Icon(
                  Icons.cancel,
                  color: Colors.grey.shade300,
                ),
                // controller: mobileNumberController,
                hintStyle: const TextStyle(),
                funValidate: (val) {
                  if (val != null && val.isEmpty) {
                    return "Please Enter 10 digit Mobile Number";
                  } else if (val != null && val.length != 10) {
                    return "Please Enter 10 digit Mobile Number";
                  }
                  return null;
                },
              ),
              sizeW10(),
              IconButton(
                  onPressed: () {},
                  icon: TextFW500(
                    text: 'Cancel',
                    fontSize: 14,
                    textcolor: themeColor,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
