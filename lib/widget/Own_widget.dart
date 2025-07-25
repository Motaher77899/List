import 'package:flutter/material.dart';
import 'package:list/exam.dart';
import 'package:list/CityCard.dart';


class OwnWidget extends StatelessWidget {
  const OwnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,top: 10.0,right: 8.0,bottom: 0.0),
          child: Column(
            children: [
              NewWidget(img:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRD___toorJRxO09qtGdnu3PBANyYHpGPUMRQ&s', title: 'jamgora',rating: '5.0',),
              SizedBox(height: 10,),
              NewWidget(img:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7UGj1d3j2PMKdQg0Q_ki1pZGpmqhPq53kSA&s',title: 'Dhaka',rating: '5.0',),
              SizedBox(height: 10,),
              NewWidget(img:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoBuMvSuYezLE9rwI-zOJeIOmcIGfDPqOvFA&s',title: 'Raipur',rating: '5.0',),
            ],
        
          ),
        ),
      ),
    );
  }
}
