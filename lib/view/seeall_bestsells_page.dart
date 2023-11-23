import 'package:flutter/material.dart';
import '../model/product_model.dart';
import 'widgets/custom_text.dart';

import '../constants.dart';

class SeeallBestsellsPage extends StatelessWidget {
  SeeallBestsellsPage({this.model});
  List<ProductModel>? model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: CustomText(
              fontSize: 25,
              // fontWeight: FontWeight.bold,
              text: 'Best Selling',
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 300,
                width: double.infinity,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 0,
                      mainAxisExtent: 270),
                  itemCount: model!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 170,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: 220,
                            child: Image.network(
                              model![index].image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .4,
                          child: CustomText(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            text: model![index].name!,
                          ),
                        ),
                        const CustomText(
                          color: Colors.grey,
                          fontSize: 12,
                          text: 'Bang and Olufsen',
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        CustomText(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          text: '\$${model![index].price!}',
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
