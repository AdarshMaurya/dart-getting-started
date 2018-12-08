void main(){
  int n = 10;
  print(n);
}
//console outputs:
/*

Try changing the type of the left hand side, or casting the right hand side to 'dart.core::int'.
  int n = "hello";
          ^
Adarsh:hello-world adarshmaurya$ dart -c  check-type-mismatch.dart
check-type-mismatch.dart:2:11: Error: A value of type 'dart.core::String' can't be assigned to a variable of type 'dart.core::int'.
Try changing the type of the left hand side, or casting the right hand side to 'dart.core::int'.
  int n = "hello";
          ^
Adarsh:hello-world adarshmaurya$

 */