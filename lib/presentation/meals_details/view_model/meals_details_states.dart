import 'package:the_meal/domain/entites/meals_details_response_entity.dart';

abstract class MealsDetailsState {
  const MealsDetailsState();
}

class MealsDetailsInitial extends MealsDetailsState {
  const MealsDetailsInitial();
}

class MealsDetailsLoading extends MealsDetailsState {
  const MealsDetailsLoading();
}

class MealsDetailsResalt extends MealsDetailsState {
  final MealDetailsResponseEntity? data;
  final String message ;
  final bool success;
  const MealsDetailsResalt({this.data, required this.message , this.success =true});
}

