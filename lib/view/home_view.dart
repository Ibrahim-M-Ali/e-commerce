import 'package:flutter/material.dart';
import '../constants.dart';
import 'widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  int index = 0;

  final List<String> names = ['Men', 'Women', 'Devices', 'Gadgets', 'Gaming'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 100, right: 15, left: 15),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextForm(),
            const SizedBox(
              height: 30,
            ),
            const CustomText(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              text: "Categories",
            ),
            const SizedBox(
              height: 30,
            ),
            CategoriesListView(),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  text: 'Best Selling',
                ),
                CustomText(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  text: 'See All',
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ProductsListView(),
          ],
        ),
      ),
    );
  }

  Widget ProductsListView() {
    return Container(
      height: 300,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                width: MediaQuery.of(context).size.width * .4,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  height: 220,
                  child: Image.asset(
                    'assets/images/clock.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                text: 'BeoPlay Speaker',
              ),
              const CustomText(
                color: Colors.grey,
                fontSize: 12,
                text: 'Bang and Olufsen',
              ),
              const SizedBox(
                height: 7,
              ),
              const CustomText(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                text: '\$755',
              ),
            ],
          );
        },
      ),
    );
  }

  Container CategoriesListView() {
    return Container(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset(
                  'assets/images/dress.png',
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                fontSize: 13,
                text: names[index],
              )
            ],
          );
        },
      ),
    );
  }
}

Widget SearchTextForm() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.grey[200]),
    child: TextFormField(
      decoration: const InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(Icons.search),
      ),
    ),
  );
}
