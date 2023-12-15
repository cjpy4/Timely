import 'package:flutter/material.dart';
import 'timer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: Container(
             color: const Color(0xFF556A80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text('Timely',
                  style: Theme.of(context).textTheme.displaySmall),
                ),
                Column(
                  children: [
                    Text('Projects',
                style: Theme.of(context).textTheme.displaySmall),
                Text('All Tasks',
                style: Theme.of(context).textTheme.displaySmall), 
              Text('Settings',
                style: Theme.of(context).textTheme.displaySmall)
                  ],
                ),
              Container(
                child: Row(
                  children: [],
                ),
              )],
            ),
          ),
        ),
          Expanded(
            flex: 3,
            child: Container(
              color: const Color(0xFF3B4252),
              child: Column(
              children: [
                Text('Hello World',
                style: Theme.of(context).textTheme.displayLarge),
                const EZtimer(initialTime: 20)
              ],
                      ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: const Color(0xFF6A8759),
              child: Column(
              children: [
               Text('Hello World',
                style: Theme.of(context).textTheme.displayLarge),
                const EZtimer(initialTime: 30)
              ],
                      ),
            ),
          ),
          ],
        );
  }
}