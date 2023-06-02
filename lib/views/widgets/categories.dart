import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  Categories({
    Key? key,
    required this.categories,
    required this.onChanged,
  }) : super(key: key);

  List<String> categories;
  ValueChanged onChanged;
  RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                /// this has been used to detect the selected index from the category
                /// name to sort them by the category
                selectedIndex.value = index;
                onChanged(selectedIndex.value);
              },
              child: Obx(() => Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      right: index == categories.length - 1 ? 30 : 0,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: index == selectedIndex.value
                          ? Colors.orange.withOpacity(0.4)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      categories[index].toUpperCase(),
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  )),
            );
          }),
    );
  }
}
