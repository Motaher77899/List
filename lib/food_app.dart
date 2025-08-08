import 'package:flutter/material.dart';
class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Top Destinations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 12,),
          GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3 / 2,
            ),
            itemBuilder: (context, index) {
              return Card(
                  elevation: 10,
                child: SizedBox(
                  height: 780,
                  width: double.infinity,

                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('asset/IMG_2346.PNG',height: 100,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Orange'),
                          Text('Orange'),
                        ],
                      ),

                    ],
                  ),
                )


              );

            },
          ),
        ],
      ),
    );
  }
}
