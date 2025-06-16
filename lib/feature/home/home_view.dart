import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/change_cubit.dart';
import '../cubit/change_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChangeCubit(),
      child: BlocConsumer<ChangeCubit, ChangeState>(
        listener: (context, state) {
          if (state is ChangeString) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('تم تغيير النص')));
          } else if (state is ChangeColor) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('تم تغيير اللون')));
          } else if (state is ChangeImage) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('تم تغيير الصورة')));
          }
        },
        builder: (context, state) {
          final cubit = context.read<ChangeCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Hellllo Maaaan'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cubit.text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 24),

                    GestureDetector(
                      onTap: cubit.changeColor,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: cubit.color,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        cubit.image,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 32),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: cubit.changeText,
                          icon: const Icon(Icons.text_fields),
                          label: const Text('Text'),
                        ),
                        ElevatedButton.icon(
                          onPressed: cubit.changeColor,
                          icon: const Icon(Icons.color_lens),
                          label: const Text('Color'),
                        ),
                        ElevatedButton.icon(
                          onPressed: cubit.changeImage,
                          icon: const Icon(Icons.image),
                          label: const Text('Image'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
