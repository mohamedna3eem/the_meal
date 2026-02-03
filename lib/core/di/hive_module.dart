import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';


@module
abstract class HiveModule {
  @preResolve
  Future<Box<Map>> get favoritesBox => Hive.openBox<Map>('favorites_box');
}
