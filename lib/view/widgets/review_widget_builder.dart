import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'custom_text.dart';

class ReviewerWidgetBuilder extends StatelessWidget {
  const ReviewerWidgetBuilder({
    super.key,
    required this.image,
    required this.name,
    required this.comment,
  });

  final String image;
  final String name;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    text: name,
                    color: const Color(0xFF3B3B3B),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  const CustomText(
                    text: "2 days ago",
                    color: Color(0xFF888888),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 0.11,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              RatingBarIndicator(
                rating: 2.75,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Color(0xFF3B3B3B),
                ),
                itemCount: 5,
                itemSize: 20,
                direction: Axis.horizontal,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: CustomText(
                  text: comment,
                  color: const Color(0xFF3B3B3B),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
