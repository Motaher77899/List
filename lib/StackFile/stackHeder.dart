import 'package:flutter/material.dart';
class Stackheder extends StatelessWidget {

  final List<Map<String, String>> destinations =[
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Header',style: TextStyle(fontSize:25 ,color:Colors.orangeAccent )),

        centerTitle: true,
      ),
      body: ListView(
      children: [
        Stack(
          children: [
            Image.network('https://images.unsplash.com/photo-1526779259212-939e64788e3c?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZnJlZSUyMGltYWdlc3xlbnwwfHwwfHx8MA%3D%3D',
            height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Explore the World',
                    style: TextStyle(fontSize:25 ,color:Colors.orangeAccent ,fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search destination...',
                        filled:true ,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: Colors.orangeAccent,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide.none)


                      ),

                    ),
                  )


                  ]

              ),
            )

          ],
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Top Destinations',style: TextStyle(fontSize:25 ,color:Colors.orangeAccent ,fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 5,
        ),

        GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
              itemCount: destinations.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3/2
            ),
            itemBuilder: (context,index) {
             return Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(12),
                 image: DecorationImage(image: NetworkImage(destinations[index]['image']!),
                 fit: BoxFit.cover
                 ),

               ),
               child: Container(
                   alignment: Alignment.bottomLeft,
                   padding: EdgeInsets.all(8),
                   child: Text(destinations[index]['name']!,style: TextStyle(fontSize:25 ,color:Colors.orangeAccent ))),
               

             );
             
            },
          
          


        ),



      ],
      ),
    );
  }
}
