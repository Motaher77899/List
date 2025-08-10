import 'package:flutter/material.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';



class WaterTankScreen2 extends StatefulWidget {
  const WaterTankScreen2({super.key});

  @override
  State<WaterTankScreen2> createState() => _WaterTankScreenState();
}

class _WaterTankScreenState extends State<WaterTankScreen2> {
  int currentInTake = 0;
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
      appBar: AppBar(
        title: const Text("Water Tank"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Card UI + Wave Effect
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
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

                  // Wave Container
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(75),
                          child: WaveWidget(
                            config: CustomConfig(
                              gradients: [
                                [Colors.blue, Colors.blue.shade200],
                                [Colors.blue.shade200, Colors.blue.shade100],
                              ],
                              durations: [3500, 5000],
                              heightPercentages: [1 - progress, 1 - progress + 0.02],
                              blur: const MaskFilter.blur(BlurStyle.solid, 2),
                              gradientBegin: Alignment.bottomLeft,
                              gradientEnd: Alignment.topRight,
                            ),
                            waveAmplitude: 10,
                            size: const Size(double.infinity, double.infinity),
                          ),
                        ),
                        Text(
                          "${(progress * 100).toStringAsFixed(0)}%",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Slider + Label
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
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
            buildWaterButton("Remove 200 LTR", Icons.remove_circle, Colors.red, () => waterRemove(200)),
            buildWaterButton("Reset", Icons.power_settings_new, Colors.red, () => resetTank()),

            const SizedBox(height: 10),

            // Reset

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