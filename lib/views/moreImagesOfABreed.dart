import 'package:assessment_zuhayrnoor/constants/constants.dart';
import 'package:assessment_zuhayrnoor/constants/extractedMethods.dart';
import 'package:assessment_zuhayrnoor/controller/getController.dart';
import 'package:assessment_zuhayrnoor/models/allBreeds.dart';
import 'package:assessment_zuhayrnoor/models/imageByBreed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetImagesByBreed extends StatefulWidget {
  const GetImagesByBreed({super.key, required this.breedName});
  final String breedName;
  @override
  State<GetImagesByBreed> createState() => _GetImagesByBreedState();
}

class _GetImagesByBreedState extends State<GetImagesByBreed> {
  getImagesOfBreed() async {
    await getQuery().imageByBreedOfDog(widget.breedName);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImagesOfBreed();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        imageByBreed = ImageByBreed();
        return await Future.value(true);
      },
      child: Scaffold(
        backgroundColor: white,
        body: imageByBreed.message == null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customCircularPogressIndicatorCentered(black),
                ],
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.06,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          widget.breedName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 26,
                              color: brown,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Two items in each row
                          crossAxisSpacing: Get.width *
                              0.02, // Space between items in the row
                          mainAxisSpacing: Get.height * 0.02,
                          // Space between rows
                        ),
                        itemCount: imageByBreed.message!.length,
                        // allBreedsModel.message?.length ??
                        //     0, // Total number of items
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              showFullscreenImageDialog(
                                  context, imageByBreed.message![index]);
                            },
                            child: Container(
                              decoration: boxDecorationForMainCardHomePage(),
                              // height:
                              //     Get.height * 0.5, // Adjust the height as needed
                              width: Get.width * 0.35,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 12),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    12.0), // Adjust the radius as needed
                                child: Image.network(
                                  imageByBreed.message![index],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: white,
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                          .expectedTotalBytes ??
                                                      1)
                                              : null,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          );
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
