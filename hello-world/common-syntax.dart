import 'dart:core';
import 'dart:mirrors';
import 'Foo.dart';

void main() {

  dartTypecheck();
  dartFinalConst();
  dartLoop();
  dartParse();
  dartString();
  dartTertiaryCondition();
  dartList();
  dartMap();
  dartSymbol();
  dartRunes();
  dartEnum;
  dartLambdaFunction();
  dartInterface();
  dartMultipleInterfaces();
  dartClass();
  dartClassConstructor();
  dartNamedClassConstructor();
  dartThisInstance();
}

void dartThisInstance() {
  Bike b = new Bike('B001');
}

class Bike {
  String engine;
  Bike(String engine){
    this.engine = engine;
    print("The engine is: ${engine}");
  }
}

void dartNamedClassConstructor() {
  Lorry l1 = new Lorry.namedConstructor('L0001');
}

class Lorry {

  Lorry.namedConstructor(String engine){
    print("The engine is: ${engine}");
  }

  Lorry(){
    print("Non-parameterized constructor invoked");
  }


}

void dartClassConstructor() {
  Truck t = new Truck('T001');
}

class Truck {
  Truck(String engine){
    print(engine);
  }
}



void dartClass() {
  Car c = new Car();
  c.disp();
}

class Car {
  //field
  String engine = "E1001";
  // function
  void disp() {
    print(engine);
  }
}

void dartMultipleInterfaces() {
  Calculator c = new Calculator ();
  print("The gross total: ${c.ret_total()}");
  print("Discount: ${c.ret_dis()}");
}

class Calculator implements Calculator_Total, Calculator_Discount {
  @override
  int ret_dis() {
    // TODO: implement ret_dis
    return 1000;
  }

  @override
  int ret_total() {
    // TODO: implement ret_total
    return 50;
  }
}

class Calculator_Total {
  int ret_total(){}
}

class Calculator_Discount {
  int ret_dis(){}
}

void dartInterface() {
  //An interface defines the syntax that any entity must adhere to.
  // Interfaces define a set of methods available on an object.
  // Dart does not have a syntax for declaring interfaces.
  // Class declarations are themselves interfaces in Dart

  ConsolePrinter cp = new ConsolePrinter();
  cp.print_data();

}

class ConsolePrinter implements Printer {
  void print_data() {
    print("__Printing to console__");
  }

  @override
  void print_graphics() {
    // TODO: implement print_graphics
  }
}

class Printer {
  void print_data(){
    print("__Print Data__");
  }

  void print_graphics(){
    print("__Print Graphics__");
  }
}

void dartTypecheck(){
  //  check-type-mismatch.dart:2:10: Error: A value of type 'dart.core::String' can't be assigned to a variable of type 'dart.core::int'.
  //  Try changing the type of the left hand side, or casting the right hand side to 'dart.core::int'.
  //  int m ="not_integer";

  //int m ="not_integer";
  int m = 101;
  print(m);

  int n;
  print(n); //prints null
}

void dartFinalConst(){

  final v1 = 13;
  const v2 = 12;

  //v2 = 12; //Error: Setter not found: 'v2'. v2=12;
  print("Print ${v1}, and ${v2}"); //cool way of print more than one variable
}

void dartLoop(){
  //for loop
  outerloop: // This is the label name

  for (var i = 0; i < 5; i++) {
    print("InnerloopA: ${i}");
    innerloop:
    for (var j = 0; j < 5; j++) {
      if (j > 3) break;

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
      if (j == 3) {
        continue outerloop;
      }
      print("InnerloopC:${j}");
    }
  }
}

void dartParse(){
  //Parsing
  print(num.parse('12'));
  print(num.parse('10.91'));
}

void dartString(){
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

void dartTertiaryCondition(){
  // conditional expression
  var a = 10;
  var res =
  a > 12 ? "value greater than 10" : "value lesser than or equal to 10";
  print(res);

  // conditional expression
  var c = null;
  var b = 12;
  var res2 = c ?? b;
  print(res2);
}

void dartList(){
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
}

void dartMap(){

  //Map Literal
  var details = {'Usrname': 'tom', 'Password': 'pass@123'};
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

void dartSymbol(){
  /*
  Symbols in Dart are opaque, dynamic string name used in reflecting out metadata
  from a library. Simply put, symbols are a way to store the relationship between
  a human readable string and a string that is optimized to be used by computers.
  Reflection is a mechanism to get metadata of a type at runtime like the number
  of methods in a class, the number of constructors it has or the number of
  parameters in a function. You can even invoke a method of the type which is
  loaded at runtime.
   */

  Symbol lib = new Symbol("foo_lib");
  //library name stored as Symbol

  Symbol clsToSearch = new Symbol("Foo");
  // class name stored as Symbol

  if (checkIf_classAvailableInlibrary(lib, clsToSearch))
    // searches Foo class in foo_lib library
    print("class found..");

  reflect_InstanceMethods(lib, clsToSearch);
}

bool checkIf_classAvailableInlibrary(Symbol libraryName, Symbol className) {
  MirrorSystem mirrorSystem = currentMirrorSystem();
  LibraryMirror libMirror = mirrorSystem.findLibrary(libraryName);

  if (libMirror != null) {
    print("Found Library");
    print("checkng...class details..");
    print("No of classes found is : ${libMirror.declarations.length}");
    libMirror.declarations.forEach((s, d) => print(s));

    if (libMirror.declarations.containsKey(className)) return true;
    return false;
  }
}

void reflect_InstanceMethods(Symbol libraryName, Symbol className) {
  MirrorSystem mirrorSystem = currentMirrorSystem();
  LibraryMirror libMirror = mirrorSystem.findLibrary(libraryName);

  if (libMirror != null) {
    print("Found Library");
    print("checkng...class details..");
    print("No of classes found is : ${libMirror.declarations.length}");
    libMirror.declarations.forEach((s, d) => print(s));

    if (libMirror.declarations.containsKey(className)) print("found class");
    ClassMirror classMirror = libMirror.declarations[className];

    print("No of instance methods found is ${classMirror.instanceMembers
        .length}");
    classMirror.instanceMembers.forEach((s, v) => print(s));
  }
}


void dartRunes() {
  //The String class in the dart:core library provides mechanisms to access runes.

  // Code units in a string can be accessed through their indexes.
  // Returns the 16-bit UTF-16 code unit at the given index.

  String x = 'Runes';
  print(x.codeUnitAt(0));
  print(x.codeUnits);

  Runes input = new Runes(' \u{1f605} ');
  print(new String.fromCharCodes(input));

  dartRunes2();
}


void dartRunes2(){
  "A string".runes.forEach((int rune) {
    var character=new String.fromCharCode(rune);
    print(character);
  });
}

enum Status {
  none,
  running,
  stopped,
  paused
}

dartEnum(){
  print(Status.values);
  Status.values.forEach((v) => print('value: $v, index: ${v.index}'));
  print('running: ${Status.running}, ${Status.running.index}');
  print('running index: ${Status.values[1]}');
}


dartLambdaFunction(){
  // Lambda Functions :Lambda functions are a concise mechanism to represent functions.
  // These functions are also called as Arrow functions.
  printMsg();
  print(test());
}

printMsg()=>
    print("hello");

int test()=>123;
// returning function