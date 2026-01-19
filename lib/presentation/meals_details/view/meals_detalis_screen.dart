import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_meal/core/loading/loading_widgit.dart';
import 'package:the_meal/presentation/meals_details/view/widget/meal_details_body.dart';
import 'package:the_meal/presentation/meals_details/view_model/meals_details_states.dart';
import 'package:the_meal/presentation/meals_details/view_model/meals_details_view_model.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MealsDetailsCubit, MealsDetailsState>(
        builder: (context , state) {
          final cubit = context.read<MealsDetailsCubit>();
          final meal = cubit.meal ;
          final imageUrl = cubit.imageUrl;

          return LoadingWidget(
            loadingState: cubit.loading,
            onRetry: () => cubit.loadMealsDetails(),
            child:MealDetailsBody(imageUrl: imageUrl, meal: meal),
          );
        },
      ),
    );
  }
}
