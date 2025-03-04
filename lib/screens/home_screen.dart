import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mytravel/screens/onboarding_screen.dart';
import 'package:mytravel/widgets/destination.dart';
import 'package:mytravel/widgets/input_search.dart';
import '../widgets/category.dart';
import '/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List destinaitonAPI = [];
  bool isLoading = true;

  signOut() async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.push(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(
        builder: (context) => OnBoardingScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse("http://localhost:3000/items"));
    if (response.statusCode == 200) {
      setState(() {
        destinaitonAPI = json.decode(response.body);
        isLoading = false;
        debugPrint("Get destination successful");
      });
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    List<CategoryIcon> categories = [
      CategoryIcon(
        title: "Forest",
        icon: Icons.forest,
        color: forestColor,
      ),
      CategoryIcon(
        title: "Camping",
        icon: Icons.terrain,
        color: campingColor,
      ),
      CategoryIcon(
        title: "Boat trip",
        icon: Icons.sailing,
        color: boatColor,
      ),
      CategoryIcon(
        title: "Hiking",
        icon: Icons.hiking,
        color: campingColor,
      ),
      CategoryIcon(
        title: "World tour",
        icon: Icons.travel_explore,
        color: forestColor,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: primaryColor,
          ),
        ),
        title: Center(
          child: Text("Travel App",
              style: TextStyle(
                color: primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              )),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Row 1 - Profile
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/profile.jpg"),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: signOut,
                      child: Icon(
                        Icons.exit_to_app,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                // Row 2 - Point of Interest
                Row(
                  children: [
                    Text(
                      "Point of Interest",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                // Row 3 - Search Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InputSearch(),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                // Row 4 - Categories
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < categories.length; i++) categories[i]
                  ],
                ),
                SizedBox(height: 15),
                // Row 5 - Top Destination
                Row(
                  children: [
                    Text(
                      "Top Destinations",
                      style: TextStyle(
                        fontSize: 25,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.tune,
                      size: 25,
                      color: primaryColor,
                    ),
                  ],
                ),
                // Row 6 - GridView count
                SizedBox(height: 20),
                GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    children: List.generate(destinaitonAPI.length, (index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        columnCount: 2,
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                            child: DestinationWidget(
                              name: destinaitonAPI[index]["name"],
                              image: destinaitonAPI[index]["image"],
                              rate: destinaitonAPI[index]["rate"],
                              location: destinaitonAPI[index]["location"],
                            ),
                          ),
                        ),
                      );
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
