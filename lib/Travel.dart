import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ListScreen.dart';

class TravelHomeScreen extends StatelessWidget {
  final List<Map<String, String>> destinations = [
    {
      'name': 'Paris',
      'image': 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800',
    },
    {
      'name': 'Maldives',
      'image': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
    },
    {
      'name': 'Dubai',
      'image': 'https://lp-cms-production.imgix.net/features/2017/09/dubai-marina-skyline-2c8f1708f2a1.jpg?auto=format,compress&q=72&w=1440&h=810&fit=crop',
    },
    {
      'name': 'Bali',
      'image': 'https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1?w=800',
    },
  ];

  final List<Map<String, String>> packages = [
    {
      'title': 'Romantic Paris Getaway',
      'price': '\$799',
      'image': 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800',
    },
    {
      'title': 'Bali Adventure Tour',
      'price': '\$599',
      'image': 'https://i0.wp.com/inclusivebalitour.com/wp-content/uploads/2019/07/Ayung-Rafting-Adventure.jpg?resize=474%2C284&ssl=1',
    },
    {
      'title': 'Nepal Tour',
      'price': '\$599',
      'image': 'https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1?w=800',
    },
    {
      'title': 'Maldive Tour',
      'price': '\$599',
      'image': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel App'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body:
      ListView(
        children: [
          // === Stack Header ===


          SizedBox(height: 20),

          // === Top Destinations (Grid) ===
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Top Destinations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
          GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: destinations.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3 / 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(destinations[index]['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black54],
                    ),
                  ),
                  child: Text(
                    destinations[index]['name']!,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),

          SizedBox(height: 20),

          // === Trending Packages (ListView + Cards) ===
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Trending Packages', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: packages.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Row(
                    children: [
                      // Left Image
                      Image.network(
                        packages[index]['image']!,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),

                      // Right Details
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                packages[index]['title']!,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 6),

                              // Duration
                              Row(
                                children: [
                                  Icon(Icons.schedule, size: 16, color: Colors.grey.shade600),
                                  SizedBox(width: 6),
                                  Text(
                                    '4 nights • 5 days',
                                    style: TextStyle(color: Colors.grey.shade600),
                                  ),
                                ],
                              ),

                              SizedBox(height: 6),

                              // Price + CTA Button
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    packages[index]['price']!,
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueAccent,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                      textStyle: TextStyle(fontSize: 12),
                                    ),
                                    child: Text("Book Now"),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.cyan,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 1) {
            // List আইকনে ট্যাপ করলে নতুন পেজে যাও
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Listscreen()),
            );
          } else{
            null;
          }
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home' ),
        BottomNavigationBarItem(icon: Icon(Icons.list_outlined),label:'List' ),
        BottomNavigationBarItem(icon: Icon(Icons.image),label:'Image' ),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz),label:'More' )
      ],
      ),


    );
  }
}

