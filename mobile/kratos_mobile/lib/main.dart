import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kratos_mobile/components/swap_box.dart';
import 'package:kratos_mobile/constants.dart';
import 'package:kratos_mobile/providers/index_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kratos App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(color: Colors.white),
          unselectedLabelStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageIndex =
        ref.watch(tabIndexStateNotifierProvider).currentPageIndex;

    final indexNotifier = ref.read(tabIndexStateNotifierProvider.notifier);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          indexNotifier.setCurrentPageIndex(index);
        },
        backgroundColor: Colors.black54,
        indicatorColor: orngCol,
        selectedIndex: currentPageIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 18),
                const Icon(Icons.swap_horiz_sharp, color: Colors.black),
                const SizedBox(height: 8),
                Text(
                  "Swap",
                  style: TextStyle(color: orngCol),
                ),
              ],
            ),
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 18),
                Icon(Icons.home, color: orngCol.withOpacity(0.3)),
                const SizedBox(height: 8),
                Text(
                  "Swap",
                  style: TextStyle(color: orngCol.withOpacity(0.0)),
                ),
              ],
            ),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 18),
                const Icon(Icons.poll_outlined, color: Colors.black),
                const SizedBox(height: 8),
                Text(
                  "Pool",
                  style: TextStyle(color: orngCol),
                ),
              ],
            ),
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 18),
                Icon(Icons.poll_outlined, color: orngCol.withOpacity(0.3)),
                const SizedBox(height: 8),
                Text(
                  "Pool",
                  style: TextStyle(color: orngCol.withOpacity(0.0)),
                ),
              ],
            ),
            label: '',
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: <Widget>[
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black,
                orngCol.withOpacity(0.01),
              ],
            ),
          ),
          child: const SwapBox(),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.blueAccent,
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.yellow,
        ),
      ][currentPageIndex],
    );
  }
}
