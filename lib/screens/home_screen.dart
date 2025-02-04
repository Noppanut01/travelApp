import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mytravel/widgets/destination.dart';
import 'package:mytravel/widgets/input_search.dart';
import '../widgets/category.dart';
import '/constants/colors.dart';
import '/models/data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          icon: Icon(
            Icons.menu,
            color: primaryColor,
          ),
          onPressed: () {},
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
              Icons.search,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
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
                    Icon(
                      Icons.menu,
                      color: primaryColor,
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
                  children: destinations.map((e) {
                    return AnimationConfiguration.staggeredGrid(
                      position: destinations.indexOf(e),
                      columnCount: 2,
                      child: SlideAnimation(
                        child: FadeInAnimation(
                          child: DestinationWidget(
                            name: e.name,
                            image: e.image,
                            rate: e.rate,
                            location: e.location,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
