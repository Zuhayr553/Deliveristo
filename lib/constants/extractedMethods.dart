import 'package:assessment_zuhayrnoor/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

BoxDecoration boxDecorationForMainCardHomePage() {
  return BoxDecoration(
      color: brown,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade400, // Light grey color for the shadow
          spreadRadius: 4, // Controls how far the shadow spreads
          blurRadius: 4, // Controls the blurriness of the shadow
          offset: Offset(0, 2), // Controls the position of the shadow
        ),
      ]);
}

Column customCircularPogressIndicatorCentered(Color color) {
  return Column(
    children: [
      const Spacer(),
      CircularProgressIndicator(
        color: color,
      ),
      const Spacer(),
    ],
  );
}

InkWell customButtomContainerInsideMainCard(
    void Function()? onTap, String text) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: Get.width * 0.4,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 242, 205),
          borderRadius: BorderRadius.circular(12)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style:
            TextStyle(color: black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

Container buildSearchBar(
    TextEditingController controller, void Function(String) onSearch) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    margin: EdgeInsets.symmetric(vertical: 12.0),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 243, 242, 205),
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: TextField(
      controller: controller,
      onChanged: (value) {
        onSearch(value);
      }, // Step 2
      decoration: const InputDecoration(
        hintText: 'Search',
        border: InputBorder.none,
        icon: Icon(Icons.search, color: Colors.black),
      ),
    ),
  );
}

void showFullscreenImageDialog(BuildContext context, String image) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pop(); // Close the dialog
        },
        child: Dialog(
          child: Container(
            width: Get.width / 1.5,
            height: Get.height / 2,
            padding: const EdgeInsets.all(6),
            child: Image.network(
              image, // Example image URL
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    },
  );
}
