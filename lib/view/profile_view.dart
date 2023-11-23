import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../core/view_model/profile_view_model.dart';
import 'auth/login_screen.dart';

import 'widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ProfileViewModel>(
          init: ProfileViewModel(),
          builder: (controller) => Container(
            // color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg'),
                          ),
                          // color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            text: controller.usersList![0].name!,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            text: controller.usersList![0].email!,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  GetBuilder<ProfileViewModel>(
                    init: ProfileViewModel(),
                    builder: (test) {
                      return TextButton(
                        onPressed: () {
                          test.signOut();
                          Get.offAll(LoginScreen());
                        },
                        child: Text('Sign out'),
                      );
                    },
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {},
                      child: const ListTile(
                        title: CustomText(
                          fontSize: 18,
                          text: 'Edit Profile',
                        ),
                        leading: Icon(
                          Icons.edit_square,
                          color: primaryColor,
                        ),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {},
                      child: const ListTile(
                        title: CustomText(
                          fontSize: 18,
                          text: 'Shopping Adress',
                        ),
                        leading: Icon(
                          Icons.location_on,
                          color: primaryColor,
                        ),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {},
                      child: const ListTile(
                        title: CustomText(
                          fontSize: 18,
                          text: 'Order History',
                        ),
                        leading: Icon(
                          Icons.history_outlined,
                          color: primaryColor,
                        ),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {},
                      child: const ListTile(
                        title: CustomText(
                          fontSize: 18,
                          text: 'Cards',
                        ),
                        leading: Icon(
                          Icons.payment,
                          color: primaryColor,
                        ),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {},
                      child: const ListTile(
                        title: CustomText(
                          fontSize: 18,
                          text: 'Notifications',
                        ),
                        leading: Icon(
                          Icons.notifications,
                          color: primaryColor,
                        ),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {},
                      child: const ListTile(
                        title: CustomText(
                          fontSize: 18,
                          text: 'Log Out',
                        ),
                        leading: Icon(
                          Icons.login,
                          color: primaryColor,
                        ),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
