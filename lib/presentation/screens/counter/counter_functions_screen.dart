import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;
  var _layout = MainAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Counter Functions',
          style: TextStyle(fontFamily: "Montserrat"),
        )),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          )
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: _layout, children: [
          Text('$clickCounter',
              style:
                  const TextStyle(fontSize: 100, fontWeight: FontWeight.w100)),
          Text('Click${clickCounter == 1 ? '' : 's'}',
              style: const TextStyle(fontSize: 50))
        ]),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.star,
        backgroundColor: Colors.green,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.plus_one,
                color: Color.fromARGB(255, 255, 255, 255)),
            label: 'Increment',
            backgroundColor: const Color.fromARGB(255, 60, 60, 60),
            onTap: incrementCounter,
          ),
          SpeedDialChild(
            child: const Icon(Icons.navigate_next, color: Colors.white),
            label: 'Layout',
            backgroundColor: const Color.fromARGB(255, 137, 77, 52),
            onTap: nextLayout,
          ),
          SpeedDialChild(
            child: const Icon(Icons.exposure_minus_1_outlined,
                color: Colors.white),
            label: 'Reduction',
            backgroundColor: const Color.fromARGB(255, 178, 66, 141),
            onTap: reductionCounter,
          ),
          SpeedDialChild(
            child: const Icon(Icons.refresh_outlined, color: Colors.white),
            label: 'Restart',
            backgroundColor: const Color.fromARGB(255, 64, 255, 188),
            onTap: restartCounter,
          ),
        ],
      ),
    );
  }

  void incrementCounter() {
    clickCounter++;
    setState(() {});
  }

  void restartCounter() {
    clickCounter = 0;
    setState(() {});
  }

  void nextLayout() {
    setState(() {
      _layout = _nextEnumLayout(_layout);
    });
  }

  MainAxisAlignment _nextEnumLayout(MainAxisAlignment value) {
    final nextIndex = (value.index + 1) % MainAxisAlignment.values.length;
    return MainAxisAlignment.values[nextIndex];
  }

  void reductionCounter() {
    if (clickCounter == 0) return;
    clickCounter--;
    setState(() {});
  }
}

// class CustomButton extends StatelessWidget {
//   final IconData icon;
//   final VoidCallback? onPressed;

//   const CustomButton({
//     super.key,
//     required this.icon,
//     this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       shape: const StadiumBorder(),
//       onPressed: onPressed,
//       child: Icon(icon),
//     );
//   }
// }

// Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: []

// CustomButton(
//               icon: Icons.plus_one_outlined,
//               onPressed: () {
//                 clickCounter++;
//                 setState(() {});
//               },
//             ),
//             const SizedBox(height: 10),
//             CustomButton(
//               icon: Icons.exposure_minus_1_outlined,
//               onPressed: () {
//                 if (clickCounter == 0) return;
//                 clickCounter--;
//                 setState(() {});
//               },
//             ),
//             const SizedBox(height: 10),
//             CustomButton(
//               icon: Icons.refresh_outlined,
//               onPressed: () {
//                 clickCounter = 0;
//                 setState(() {});
//               },
//             )
