import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  SearchBox({Key? key, required this.onChanged}) : super(key: key);

  ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5, // 5 top and bottom
      ),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: const Icon(Icons.search),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
        ),
      ),
    );
  }
}
