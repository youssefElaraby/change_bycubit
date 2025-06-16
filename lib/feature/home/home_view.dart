import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/appCubit.dart';
import '../cubit/state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubitttttt'),
        centerTitle: true,
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(state.text, style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () => context.read<AppCubit>().updateAll(),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 120,
                    height: 120,
                    color: state.color,
                    child: Center(
                      child: Text('Count = ${state.count}',
                          style: const TextStyle(fontSize: 20)),
                    ),
                  ),
                ),


              ],
            ),
          );
        },
      ),
    );
  }
}
