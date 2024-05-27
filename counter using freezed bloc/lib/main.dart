import 'package:delete/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(
          title: 'counter',
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      //***************************************text************************************************************ */
      body: Center(
        child: Column(
          children: [
            const Text('you have pushed the button this meny tmes'),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text('${state.count}');
              },
            ),
          ],
        ),
      ),
      //**************************************floating************************* */
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(increment());
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(decrement());
            },
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
