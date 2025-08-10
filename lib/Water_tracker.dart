import 'package:flutter/material.dart';
import 'package:list/widget/Water_tank_Button.dart';

class WaterTracker extends StatefulWidget {
  const WaterTracker({super.key});

  @override
  State<WaterTracker> createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  int currentInTake =0;
  final int goal = 5000;

  void waterAdd(int amount){
    setState(() {
      currentInTake = (currentInTake + amount).clamp(0, goal);
    });
  }
 void resetTank(){
    setState(() {
      currentInTake=0;
    });
 }


  @override
  void initState(){
    super.initState();
  }
  Widget build(BuildContext context) {
    double progress = (currentInTake/goal).clamp(0, 1);
    return Scaffold(
      appBar: AppBar(
        title: Text('Water Tracker'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent.shade100,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 2,
            
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Text('Today\'s In Tank',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                        Text('${currentInTake} LTR',style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.blueAccent))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Stack(
                  alignment: Alignment.center,
            
                  children: [
                   Container(
                     height: 160,
                     width: 160,
                     child: CircularProgressIndicator(
                       backgroundColor: Colors.grey,
                       color: Colors.blueAccent,
                       strokeWidth: 7,
                       value: progress,
                     ),
            
                   ),
                    Text('${(progress*100).toInt()}%',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.blueAccent))
                  ],
                ),
                SizedBox(height: 15,),
                Wrap(
                  children: [
                    WaterTankButon(amount: 100, onClick: ()=> waterAdd(100),),
                    WaterTankButon(amount: 200, onClick: ()=> waterAdd(200),),
                    WaterTankButon(amount: 500, onClick: ()=> waterAdd(500),),
                    WaterTankButon(amount: 100, onClick: ()=> waterAdd(-100),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: ()=>resetTank(),
                      child: Text('Reset',style: TextStyle(color: Colors.white),),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red)
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


