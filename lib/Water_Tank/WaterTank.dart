import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


class WaterTankScreen extends StatefulWidget {
  const WaterTankScreen({super.key});

  @override
  State<WaterTankScreen> createState() => _WaterTankScreenState();
}

class _WaterTankScreenState extends State<WaterTankScreen> {
  int currentInTake = 0; // শুরু লেভেল
  final int goal = 5000;

  void waterAdd(int amount) {
    setState(() {
      currentInTake = (currentInTake + amount).clamp(0, goal);
    });
  }

  void waterRemove(int amount) {
    setState(() {
      currentInTake = (currentInTake - amount).clamp(0, goal);
    });
  }

  void resetTank() {
    setState(() {
      currentInTake = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = (currentInTake / goal).clamp(0, 1);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text(
            "Water Tank",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Card UI
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.6),
                    blurRadius: 15,
                     offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Water Level : $currentInTake / $goal",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 10.0,
                    percent: progress,
                    center: Text(
                      "${(progress * 100).toStringAsFixed(0)}%",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    progressColor: Colors.blue,
                    backgroundColor: Colors.grey.shade300,
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Slider + Label
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Text("0 L", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("5000 L", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Slider(
              value: currentInTake.toDouble(),
              min: 0,
              max: goal.toDouble(),
              divisions: goal ~/ 100,
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  currentInTake = value.toInt();
                });
              },
            ),
            const SizedBox(height: 10),

            // Buttons
            buildWaterButton("100 LTR Water", Icons.water_drop, Colors.orange, () => waterAdd(100)),
            buildWaterButton("500 LTR Water", Icons.waves, Colors.orange, () => waterAdd(500)),
            buildWaterButton("1000 LTR Water", Icons.water, Colors.orange, () => waterAdd(1000)),

            const SizedBox(height: 15),

            // Remove Button
            buildWaterButton("Remove 100 LTR", Icons.remove_circle, Colors.red, () => waterRemove(100)),

            const SizedBox(height: 10),
            buildWaterButton("Reset", Icons.power_settings_new, Colors.red, () => resetTank()),

            // Reset
            ElevatedButton(style: ElevatedButton.styleFrom(
              backgroundColor:Colors.red,
              elevation: 4,

              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
              onPressed: resetTank,
              child: const Text(
                "Reset Water Level",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF5F9FF),
    );
  }

  Widget buildWaterButton(String label, IconData icon, Color color, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 4,
          shadowColor: color.withOpacity(0.4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}