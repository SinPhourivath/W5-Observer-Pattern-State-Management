import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week5/EXERCISE-2/models/color_counters.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ColorCounters(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Home()),
      ),
    ),
  );
}

enum CardType { red, blue }

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    print("Home rebuilt");
    return Consumer<ColorCounters>(
      builder: (_, colorCounters, __) {
        int currentIndex = colorCounters.currentIndex;

        return Scaffold(
          body: currentIndex == 0 ? ColorTapsScreen() : StatisticsScreen(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              colorCounters.changeIndexTo(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.tap_and_play),
                label: 'Taps',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'Statistics',
              ),
            ],
          ),
        );
      },
    );
  }
}

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Color tap screen rebuilt");
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [ColorTap(type: CardType.red), ColorTap(type: CardType.blue)],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;

  const ColorTap({super.key, required this.type});

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    print("Color tap rebuilt");
    return Consumer<ColorCounters>(
      builder: (_, colorCounters, __) {
        final tapCount =
            type == CardType.red
                ? colorCounters.redTapCount
                : colorCounters.blueTapCount;
        final onTap =
            type == CardType.red
                ? colorCounters.incrementRedTapCount
                : colorCounters.incrementBlueTapCount;

        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 100,
            child: Center(
              child: Text(
                'Taps: $tapCount',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Statistics screen rebuilt");
    return Consumer<ColorCounters>(
      builder: (_, colorCounters, __) {
        return Scaffold(
          appBar: AppBar(title: Text('Statistics')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Red Taps: ${colorCounters.redTapCount}',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'Blue Taps: ${colorCounters.blueTapCount}',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
