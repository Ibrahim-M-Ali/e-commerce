import 'package:flutter/material.dart';
import 'package:operations/view/featured_page.dart';
import 'collection_page.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          // backgroundColor: Colors.black,
          body: Container(
            decoration: const BoxDecoration(
              gradient: kGradient,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 5, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 250,
                        height: 100,
                        child: TabBar(
                          dividerColor: Colors.transparent,
                          indicatorColor: Colors.transparent,
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0.09,
                          ),
                          unselectedLabelStyle: TextStyle(
                            color: Color(0xFFC4C4C4),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                          ),
                          unselectedLabelColor: Color(0xFFC4C4C4),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: UnderlineTabIndicator(
                            borderRadius: BorderRadius.all(
                              Radius.circular(150),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFC4C4C4),
                              width: 3,
                            ),
                            insets:
                                EdgeInsets.only(right: 50, bottom: 30, left: 0),
                          ),
                          tabs: [
                            Text(
                              'Collection',
                            ),
                            Text(
                              'Featured',
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                                'assets/images/icons/search-normal.png'),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                                'assets/images/icons/notification-bing.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: TabBarView(
                      children: [
                        CollectionPage(),
                        FeaturedPage(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
