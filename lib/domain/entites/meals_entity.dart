class MealsResponseEntity {
  final List<MealsEntity> meals ;
  MealsResponseEntity({required this.meals});
}

class MealsEntity {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;
  MealsEntity({
   required this.strMeal ,
   required this.strMealThumb,
   required this.idMeal});
}
