import 'package:the_meal/domain/entites/meals_entity.dart';

abstract class MealsState {
  const MealsState();
}

class MealsInitial extends MealsState {
  const MealsInitial();
}

class MealsLoading extends MealsState {
  const MealsLoading();
}

class MealsResalt extends MealsState {
  final MealsResponseEntity? data;
  final String message ;
  final bool success;
  const MealsResalt({this.data, required this.message , this.success =true});
}

