import 'package:flutter/material.dart';
class WaterTankButon extends StatelessWidget {
  final int amount;
  IconData ? icon;
  final VoidCallback onClick;

   WaterTankButon({
    super.key, required this.amount, required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton.icon(onPressed: onClick, icon: Icon(icon??Icons.water_drop,),label: Text('+${amount}LTR',style: TextStyle(color: Colors.white),),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
        ),
      ),
    );
  }
}