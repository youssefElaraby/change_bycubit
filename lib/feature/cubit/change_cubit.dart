import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'change_state.dart';


class ChangeCubit extends Cubit<ChangeState> {
  ChangeCubit() : super(ChangeInitial());

  String text = 'هغيرررررك';
  void changeText() {
    text = 'تم التغير يابررووو';
    emit(ChangeString());
  }
  Color color = Colors.blue;
  void changeColor() {
    color = Colors.green;
    emit(ChangeColor());
  }

  String image = 'assets/images/third_onbord.png';
  void changeImage() {
    image = 'assets/images/ronaldo.jpg';
    emit(ChangeImage());
  }

}
