import 'package:bloc_consumer_training/bloc/bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Builder'),
        centerTitle: true,
      ),

      // "BlocConsumer" merupakan gabungan dari "BlocBuilder" dan "BlocListener"
      body: BlocConsumer<Counter, int>(
        bloc: myCounter,
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "$state",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 22,
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state == 15) {
            //print(state);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('sudah mencapai angka $state'),
                duration: const Duration(milliseconds: 800),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => myCounter.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), //
    );
  }
}
