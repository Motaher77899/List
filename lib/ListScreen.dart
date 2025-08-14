// import 'package:flutter/material.dart';
// import 'package:list/model.dart';
// class Listscreen extends StatelessWidget {
//  final List<ListModel> models = [
//    ListModel ('1','Bijoy','facebook','90'),
//    ListModel ('2','Mysha','book','40'),
//    ListModel ('3','Nadim','snap','60'),
//    ListModel ('4','Shakil','messenger','80'),
//    ListModel ('5','Bijoy','facebook','90'),
//    ListModel ('6','Mysha','book','40'),
//    ListModel ('7','Rakib','viber','55' ),
//    ListModel ('8','Shakil','messenger','80'),
//    ListModel ('9','Bijoy','facebook','90'),
//    ListModel ('10','Mysha','book','40'),
//    ListModel ('11','Nadim','imo','60'),
//    ListModel ('12','Shakil','messenger','80'),
//    ListModel ('13','Bijoy','facebook','90'),
//    ListModel ('13','Mysha','book','40'),
//    ListModel ('14','Nadim','imo','60'),
//    ListModel ('15','Shakil','messenger','80'),
//  ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List Page'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context); // এটা ব্যাক করে Home Page-এ ফিরিয়ে নিয়ে যাবে
//           },
//         ),
//       ),
//       body: ListView.builder(
//
//           itemCount: models.length,
//           itemBuilder:(context, index){
//             final model = models[index];
//             return Card(
//               child: ListTile(
//                 leading:Text(model.id!) ,
//                 title: Text(model.name,style: TextStyle(color: Colors.blue, fontSize: 20),),
//                 subtitle:Text(model.dept) ,
//                 trailing: Text(model.gpa),
//               ),
//             );
//           }
//       ),
//      // backgroundColor: Colors.orangeAccent,
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             DrawerHeader(
//                 child:
//                 UserAccountsDrawerHeader(
//                   currentAccountPicture:Image.asset('asset/Tes. Card.jpg') ,
//                 accountName: Text('MD Bijoy'),
//                 accountEmail: Text('bijoy@gmail.com')
//
//             )
//             ),
//
//             ListTile(title: Text('Home'), leading: Icon(Icons.home)),
//             ListTile(title: Text('Mobile'),leading: Icon(Icons.phone)),
//             ListTile(title: Text('Email'),leading: Icon(Icons.mail)),
//             ListTile(title: Text('Setting'),leading: Icon(Icons.settings)),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ListModel {
// }