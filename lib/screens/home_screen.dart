import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mytravel/widgets/destination.dart';
import '/constants/colors.dart';
import '/models/data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
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
                    style: TextStyle(
                      fontSize: 25,
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              // Row 3 - Search Bar
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: 20),
                  // Container(
                  //   padding: EdgeInsets.all(15),
                  //   decoration: BoxDecoration(
                  //     color: primaryColor,
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //   child: Icon(
                  //     Icons.tune,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 15),
              // Row 4 - Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage("assets/images/travel-1.jpg"),
                      ),
                      Text("Forest")
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage("assets/images/travel-2.jpg"),
                      ),
                      Text("Camping")
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage("assets/images/travel-8.jpg"),
                      ),
                      Text("Boat trip")
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage("assets/images/travel-4.jpg"),
                      ),
                      Text("Hiking")
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage("assets/images/travel-1.jpg"),
                      ),
                      Text("World tour")
                    ],
                  ),
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
                  }).toList()),
            ],
          ),
        ),
      ),
    );
  }
}
