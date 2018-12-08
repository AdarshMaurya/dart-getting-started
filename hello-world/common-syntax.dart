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

  // conditional expression
  var a = 10;
  var res = a > 12 ? "value greater than 10":"value lesser than or equal to 10";
  print(res);

  // conditional expression
  var c = null;
  var b = 12;
  var res2 = c ?? b;
  print(res2);

  //list - fixed and grow able list

  var lst = new List(3); //declaring a list
  lst[0] = 12; //initializing a list
  lst[1] = 13;
  lst[2] = 11;
  print(lst);

  //growable list
  var lst2 = new List();
  lst2.add(12);
  lst2.add(13);
  print(lst2);
  print("${lst2.last} ${lst2.first}"); //lots of property with list

  //Map Literal
  var details = {'Usrname':'tom','Password':'pass@123'};
  print(details);

  //Adding value to Map literals at Runtime
  details['Uid'] = 'U1oo1';
  print(details);

  //Map constructor
  var details2 = new Map();
  details2['Usrname'] = 'admin';
  details2['Password'] = 'admin@123';
  print(details2);
  
}
