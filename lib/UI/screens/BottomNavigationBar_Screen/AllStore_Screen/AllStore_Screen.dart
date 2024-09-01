import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sphere/UI/components/Custom_LeadingBack.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/custom_Curt.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Stores_Screens/Stores_Screen.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';
import 'package:sphere/core/constants/Const_text.dart';
import 'package:sphere/generated/assets.dart';

class AllStoreScreen extends StatefulWidget {
  const AllStoreScreen({super.key});

  @override
  State<AllStoreScreen> createState() => _AllStoreScreenState();
}

class _AllStoreScreenState extends State<AllStoreScreen> {
  List<String> imageList = [
    'Assets/Images/image1.jpeg',
    'Assets/Images/image2.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ConstColors.primarycolor,
        actions: const [
          CustomCurt(),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: ConstColors.primarycolor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.amberAccent,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: 3),
                  viewportFraction: 0.8,
                  aspectRatio: 16 / 9,
                  initialPage: 0,
                ),
                items: imageList
                    .map((item) => Container(
                          child: Center(
                            child: Image.network(
                              item,
                              fit: BoxFit.cover,
                              width: 1000,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      titletext: 'All Store',
                      fontsize: Heading1,
                      bold: FontWeight.bold,
                      textcolor: ConstColors.seconderyColor),
                  Icon(
                    Icons.arrow_drop_down,
                    color: ConstColors.seconderyColor,
                  )
                ],
              ),
            ),
            Expanded(
                child: GridView.builder(
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 2 / 2.7,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const StoresScreen();
                          }));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          color: ConstColors.customGrey.withOpacity(0.1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: ConstColors.primarycolor,
                                radius: size.width * 0.13,
                                backgroundImage:
                                    AssetImage(ImagesAssets.firstImage),
                              ),
                              CustomText(
                                  titletext: storeName,
                                  fontsize: normalText,
                                  bold: FontWeight.w500,
                                  textcolor:
                                      ConstColors.blackColor.withOpacity(0.5))
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
