import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'an_internet_problem_try_again': 'an internet problem try again',
      'error_in_yor_internet_connection': 'error in yor internet connection',
      'un_exception_error': 'un exception error',
      'connection_request_timeout_y_bro': 'Connection request timeout y bro.',
      'send_timeout_in_connection_with_api_server':
          'Send timeout in connection with API server.',
      'receive_timeout_in_connection_with_api_server':
          'Receive timeout in connection with API server.',
      'bad_certificate': 'Bad certificate',
      'bad_response_with_status_code': 'Bad response with status code:',
      'request_to_api_server_was_cancelled':
          'Request to API server was cancelled.',
      'connection_error': 'Connection error.',
      'category_meals': '@category Meals',
      'meal_categories':'Meal Categories',
      '_ingredients':' Ingredients',
      '_measure':' measure'
    },
  };
}
