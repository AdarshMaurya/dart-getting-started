void main() {

  //  check-type-mismatch.dart:2:10: Error: A value of type 'dart.core::String' can't be assigned to a variable of type 'dart.core::int'.
  //  Try changing the type of the left hand side, or casting the right hand side to 'dart.core::int'.
  //  int m ="not_integer";

  //int m ="not_integer";
  int m = 101;
  print(m);

  int n;
  print(n); //prints null

  final v1 = 13;
  const v2 = 12;

  //v2 = 12; //Error: Setter not found: 'v2'. v2=12;
  print("Print ${v1}, and ${v2}"); //cool way of print more than one variable

//for loop
  outerloop: // This is the label name

  for (var i = 0; i < 5; i++) {
    print("InnerloopA: ${i}");
    innerloop:

    for (var j = 0; j < 5; j++) {
      if (j > 3 ) break ;

      // Quit the innermost loop
      if (i == 2) break innerloop;

      // Do the same thing
      if (i == 4) break outerloop;

      // Quit the outer loop
      print("InnerloopB: ${j}");
    }
  }


  outerloop: // This is the label name

  for (var i = 0; i < 3; i++) {
    print("Outerloop:${i}");

    for (var j = 0; j < 5; j++) {
      if (j == 3){
        continue outerloop;
      }
      print("InnerloopC:${j}");
    }
  }

  //Parsing
  print(num.parse('12'));
  print(num.parse('10.91'));


  String str1 = 'this is a single line string';
  String str2 = "this is a single line string";
  String str3 = '''this 
  is a 
  multiline line 
  string
 ''';
  String str4 = """this 
  is a 
  multiline line 
  string""";

  print(str1);
  print(str2);
  print(str3);
  print(str4);
}
