// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'review_widget_builder.dart';

class ReviewWidget extends StatelessWidget {
  final List<String> reviewersImages = [
    'assets/images/review1.png',
    'assets/images/review2.png',
    'assets/images/review3.png',
  ];
  final List<String> reviewersNames = [
    'Theresa Webb',
    'Arlene McCoy',
    'Jerome Bell'
  ];
  final List<String> reviewersComments = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris,',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 170,
                width: double.infinity,
                child: ReviewerWidgetBuilder(
                  image: reviewersImages[index],
                  name: reviewersNames[index],
                  comment: reviewersComments[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
