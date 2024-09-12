import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

class SliverGrideShimmer extends StatelessWidget {
  const SliverGrideShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2.5,
          // mainAxisSpacing: 10 //,
          //crossAxisSpacing: 10
        ),
        itemBuilder: (context, index) {
          // if (!snapshot.hasData ||
          //     snapshot.data == null ||
          //     snapshot.data!.docs.isEmpty ||
          //     snapshot.hasError ||
          //     snapshot.connectionState == ConnectionState.waiting) {
          //   return SliverToBoxAdapter(child: CircularProgressIndicator());
          // }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) {
                  //   return ProductDerailScreen(
                  //     image: dememodel[index]['image'] ??
                  //         '', // Default to empty string if null
                  //     storename:
                  //         dememodel[index]['store'] ?? 'Unknown Store',
                  //     price: (dememodel[index]['price'] ??
                  //         0.0), // Default to 0.0 if null and convert to String
                  //     productname: dememodel[index]['productname'] ??
                  //         'Unknown Product',
                  //     discountprice: (dememodel[index]['discountprice'] ??
                  //         0.0), // Default to 0.0 if null and convert to String
                  //     description: dememodel[index]['description'] ??
                  //         'No Description',
                  //     stock: dememodel[index]['stock'] ??
                  //         'Out of Stock', // Default value if null
                  //   );
                  // }));
                },
                child: Shimmer.fromColors(
                  baseColor: ConstColors.basecolor,
                  highlightColor: ConstColors.highlightcolor,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ConstColors.primarycolor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Container(
                              //height: 155,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                //  color: Colors.orange,

                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16)),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [],
                              )),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                              alignment: Alignment.bottomCenter,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: ConstColors.primarycolor,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                )),
          );
        });
  }
}
