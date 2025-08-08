// import 'package:flutter/material.dart';
// import 'package:flutter_ostad_11/module_8/modue_8_class_2.dart';
// import 'package:flutter_ostad_11/module_8/module_8_class_1.dart';
//
// import '../module_8/assignment.dart';
// import '../module_8/module8_stack.dart';
//
// class class3 extends StatelessWidget {
//   const class3({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Class 3'),
//       ),
//       body: Column(
//         children: [
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/',
//
//                 );
//               },
//               child: Text('Travel')),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/class1');
//               },
//               child: Text('Class-1')),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/class2');
//               },
//               child: Text('Class-2')),
//
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, PageRouteBuilder(
//                     pageBuilder: (context,animation,secondaryAnimation) => TravelHomeScreen(),
//                     transitionsBuilder: (context,animation,secondaryAnimation,child){
//                       const  begin = Offset(1.0, 0);
//                       const  end = Offset.zero;
//                       const  curve = Curves.ease;
//
//                       var tween = Tween(begin: begin,end: end).chain(CurveTween(curve: curve));
//                       return SlideTransition(position: animation.drive(tween),child: child,);
//                     }
//
//                 ));
//               },
//               child: Text('Travel 2')),
//
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Module8Stack()));
//               },
//               child: Text('Class-3')),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Module8Class1()));
//               },
//               child: Text('Class-1')),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Module8Stack()));
//               },
//               child: Text('Class-3')),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Module8class2()));
//               },
//               child: Text('Class-2')),
//
//           TextField(),
//           Text('Class-3',
//             style: Theme.of(context).textTheme.headline1,
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';



class MyBasketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Salad App',
      home: FruitSaladScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FruitSaladScreen extends StatelessWidget {
  final List<Map<String, String>> recommended = [
    {
      "title": "Honey lime combo",
      "price": "₦ 2,000",
      "image": "https://via.placeholder.com/100x100.png?text=Honey+Lime"
    },
    {
      "title": "Berry mango combo",
      "price": "₦ 8,000",
      "image": "https://via.placeholder.com/100x100.png?text=Berry+Mango"
    },
  ];

  final List<Map<String, String>> hottest = [
    {
      "title": "Quinoa fruit salad",
      "price": "₦ 10,000",
      "image": "https://via.placeholder.com/100x100.png?text=Quinoa"
    },
    {
      "title": "Tropical fruit salad",
      "price": "₦ 10,000",
      "image": "https://via.placeholder.com/100x100.png?text=Tropical"
    },
    {
      "title": "Melon fruit salad",
      "price": "₦ 10,000",
      "image": "https://via.placeholder.com/100x100.png?text=Melon"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, size: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.shopping_basket_outlined),
                      Text("My basket", style: TextStyle(fontSize: 12))
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Greeting text
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  children: [
                    TextSpan(text: "Hello Kante, "),
                    TextSpan(
                      text: "What fruit salad combo do you want today?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Search bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for fruit salad combos',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.tune),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Recommended Combo title
              Text("Recommended Combo", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              // Recommended Combo list
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommended.length,
                  itemBuilder: (context, index) {
                    var item = recommended[index];
                    return Container(
                      width: 120,
                      margin: EdgeInsets.only(right: 16),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(item['image']!, height: 60, width: 60),
                          ),
                          SizedBox(height: 8),
                          Text(item['title']!, style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 4),
                          Text(item['price']!, style: TextStyle(color: Colors.orange)),
                          Spacer(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.add_circle, color: Colors.orange),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              // Tabs (Hottest, Popular etc)
              Row(
                children: [
                  Text("Hottest", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(width: 16),
                  Text("Popular", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 16),
                  Text("New combo", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 16),
                  Text("Top", style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 12),
              // Hottest List
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hottest.length,
                  itemBuilder: (context, index) {
                    var item = hottest[index];
                    return Container(
                      width: 140,
                      margin: EdgeInsets.only(right: 16),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(item['image']!, height: 60, width: 60),
                          ),
                          SizedBox(height: 10),
                          Text(item['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          Text(item['price']!, style: TextStyle(color: Colors.orange)),
                          Spacer(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.add_circle, color: Colors.orange),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
