import 'package:abstracta_ivo/app/app.dart';
import 'package:abstracta_ivo/bootstrap.dart';

void main() {
  bootstrap(
    (localStorageService) => App(
      localStorageService: localStorageService,
    ),
  );
}
