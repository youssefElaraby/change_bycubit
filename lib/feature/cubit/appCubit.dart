import 'package:change_bycubit/feature/cubit/state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
    const AppState(
      text: 'Starttttttt',
      color: Colors.blue,
      count: 0,
    ),
  );

  void updateAll() {
    emit(
      state.change(
        text: 'doneeeeee',
        color: state.color == Colors.blue ? Colors.red : Colors.blue,
        count: state.count + 1,
      ),
    );
  }
}
