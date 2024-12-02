import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jwt_starter/view%20model/register_viewmodel.dart';
import 'package:jwt_starter/widgets/restaurant_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RegisterViewModel registerViewModel = RegisterViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0.w), // Responsive padding
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.h.verticalSpace, // Responsive vertical space
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundImage: const AssetImage(
                            'assets/images/profile.png'), // Replace with your image asset
                      ),
                      10.w.horizontalSpace,
                      Text(
                        'Hello, User',
                        style: TextStyle(
                          fontFamily: "RobotoCondensed",
                          fontSize: 20.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      // Add your notification click functionality here
                    },
                    icon: Stack(
                      children: [
                        Icon(
                          Icons.notifications_outlined,
                          size: 28.sp,
                        ),
                        Positioned(
                          top: 0.h,
                          right: 0.w,
                          child: CircleAvatar(
                            radius: 6.r,
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              20.h.verticalSpace,
              // CustomStyledTextField(
              //   hintText:
              //       'Search Restaurants, Cuisines, Dishes and Much More... ',
              //   prefixIcon: const Icon(Icons.search),
              //   prefixIconColor: Colors.grey,
              //   prefixIconSize: 25.sp,
              // ),
              20.h.verticalSpace,
              Text(
                "Today's Offer's",
                style: TextStyle(
                  fontFamily: "RobotoCondensed",
                  fontSize: 18.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              10.h.verticalSpace, // Space between text and cards
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    offerCard("assets/images/Offer1.png"),
                    SizedBox(width: 10.w), // Space between cards
                    offerCard("assets/images/offer2.png"),
                    SizedBox(width: 10.w),
                    offerCard("assets/images/Offer1.png"),
                    SizedBox(width: 10.w),
                    offerCard("assets/images/offer2.png"),
                  ],
                ),
              ),
              20.verticalSpace,
              Text(
                "Eat what makes you happy",
                style: TextStyle(
                  fontFamily: "RobotoCondensed",
                  fontSize: 18.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const RestaurantCard(
                name: "The Food Lounge",
                cuisines: "Italian, Chinese",
                price: "₹200 for two",
                rating: 4.5,
              ),

              ElevatedButton(
                onPressed: () async {
                  // Call the logout functionality
                  await registerViewModel.logoutUser(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  "Log Out",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget offerCard(String imagePath) {
    return Container(
      width: 180.w, // Fixed width for cards
      height: 125.h, // Fixed height for cards
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
