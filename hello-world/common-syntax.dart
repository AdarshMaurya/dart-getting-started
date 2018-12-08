import 'dart:collection';
import 'dart:core';
import 'dart:math';
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
  dartGetterAccessorSetterMutators();
  dartClassInheritance();
  dartClassMultiLevelClassInheritance();
  dartInheritanceMethodOverriding();
  dartStaticKeyword();
  dartSuperKeyword();
  dartObjectStateBehaviorIdentity();
  dartCascadeOperator();
  dartStringManipulation();
  dartCollectionList();
  dartCollectionSet();
  dartCollectionMap();
  dartCollectionQueue();
}

void dartCollectionQueue() {
  Queue queue = new Queue();
  print("queue Default implementation ${queue.runtimeType}");
  queue.add(10);
  queue.add(20);
  queue.add(30);
  queue.add(40);

  for(var no in queue){
    print(no);
  }
  //addAll()
  print("queue Default implementation ${queue.runtimeType}");
  queue.addAll([10,12,13,14]);
  for(var no in queue){
    print(no);
  }

  //addFirst()
  Queue numQ = new Queue();
  numQ.addAll([100,200,300]);
  print("Printing Q.. ${numQ}");
  numQ.addFirst(400);
  print("Printing Q after addFirst(400).. ${numQ}");

  //addLast()
  numQ.addLast(500);
  print("Printing Q afte addLast(500).. ${numQ}");
}

void dartCollectionMap() {
  //A Map is a dynamic collection. In other words, Maps can grow and shrink at runtime.
  // The Map class in the dart:core library provides support for the same.
  var details = new Map();
  details['Usrname']='admin';
  details['Password']='admin@123';
  print(details);

  //HasMap
  var accounts = new HashMap();
  accounts.addAll({'dept':'HR','email':'tom@xyz.com'});
  print('Map after adding  entries :${accounts}');

  accounts['dept'] = 'HR';
  accounts['name'] = 'Tom';
  accounts['email'] = 'tom@xyz.com';
  print('Map after adding  entries :${accounts}');
  accounts.remove('dept');
  print('Map after removing  entry :${accounts}');
  accounts.clear();
  print('Map after clearing entries :${accounts}');

}

void dartCollectionSet() {
  Set numberSet = new  Set();
  numberSet.add(100);
  numberSet.add(20);
  numberSet.add(5);
  numberSet.add(60);
  numberSet.add(70);
  print("numberSet Default implementation :${numberSet.runtimeType}");
  // all elements are retrieved in the order in which they are inserted
  for(var no in numberSet) {
    print(no);
  }

  Set numberSet2 = new Set.from([12,13,14]);
  print("numberSet2 Default implementation :${numberSet2.runtimeType}");
  // all elements are retrieved in the order in which they are inserted
  for(var no in numberSet2) {
    print(no);
  }

  //Hast Set
  Set numberHashSet = new  HashSet();
  numberHashSet.add(100);
  numberHashSet.add(20);
  numberHashSet.add(5);
  numberHashSet.add(60);
  numberHashSet.add(70);
  print("numberHashSet Default implementation :${numberHashSet.runtimeType}");
  for(var no in numberHashSet){
    print(no);
  }

  //adding multiple values to HashSet
  numberHashSet.addAll([100,200,300]);
  print("numberHashSet Default implementation :${numberSet.runtimeType}");
  for(var no in numberHashSet){
    print(no);
  }

  print("Printing hashet.. ${numberHashSet}");
  numberHashSet.remove(100);
  print("Printing  after remove(100) numberHashSet.. ${numberHashSet}");
  numberHashSet.clear();
  print("Printing after clear() numberHashSet.. ${numberHashSet}");

}

void dartCollectionList() {
  //dart does not support array
  // dart:core provides the List class

  List logTypes = new List();
  logTypes.add("WARNING");
  logTypes.add("ERROR");
  logTypes.add("INFO");

  //iterating across list
  for(String type in logTypes){
    print("logTypes: ${type}");
  }

  //printing size of the list
  print("logTypes size: ${logTypes.length}");

  //remove "Warning"
  logTypes.remove("Warning");

  print("size after removing.");
  print(logTypes.length);

}

void dartStringManipulation() {
  //some example

  int num = -8;

  print(num.toString());
  print(num.toString().substring(0,1));

  print(num.toRadixString(2));
  print(num.abs());
  print(num.toUnsigned(2));
  print(num.round());

}

void dartCascadeOperator() {

  // Every time a function is called, a reference to the object is required.
  // The cascade operator can be used as a shorthand in cases where
  // there is a sequence of invocations.

  new ObjectCascade()
      ..reference_to_method_one()
      ..reference_to_method_two();
}

class ObjectCascade {
  reference_to_method_one() {
    print("This is a test method 1");
  }

  reference_to_method_two() {
    print("This is a test method 2");
  }

}

void dartObjectStateBehaviorIdentity() {
  ObjectBluePrint obj = new ObjectBluePrint();
  obj.setHasCode(1);
  print("Object Identity: ${obj.hashCode}");
  obj.behavior(true);

  ObjectBluePrint obj2 = new ObjectBluePrint();
  obj2.setHasCode(2);
  print("Object Identity: ${obj.hashCode}");
  obj2.behavior(true);

  if(obj != obj2 ){
    print("Compare obj and obj2 :");
    print("obj = ${obj.hashCode}");
    print("obj2 = ${obj2.hashCode}");
  }

  ObjectBluePrint obj3 = new ObjectBluePrint();
  obj3.setHasCode(2);
  print("Object Identity: ${obj3.hashCode}");
  obj3.setHasCode(obj3.hashCode);
  obj3.behavior(true);

  if(obj2 == obj3 ){
    print("Compare obj2 and obj3 :");
    print("obj2 = ${obj2.hashCode}");
    print("obj3 = ${obj3.hashCode}");
  }
  print("Compare obj2 and obj2 : ${identical(obj2, obj2)}");
  print("Compare obj2 and obj3 : ${identical(obj2, obj3)}");
  print("Compare obj3 and obj3 : ${identical(obj3, obj3)}");
}

class ObjectBluePrint {

  bool state;
  int objIdentity;

  void behavior(bool state){
    print("Lets change state");
    print("state of boolean state: ${this.state}");
    this.state = state;
    print("state changed to ${this.state}");
  }

  @override
  int get hashCode {
    return objIdentity;
  }

  void setHasCode(int hashCode) {
    objIdentity = hashCode;
  }


}

void dartSuperKeyword() {
  // The super keyword is used to refer to the immediate parent of a class.
  // The keyword can be used to refer to the super class version of a variable,
  // property, or method.

  SuperChild c = new SuperChild();
  c.print_name("Super Child");
}

class SuperChild extends SuperParent{

  @override
  void print_name(String name) {
    print("Overriding SuperParent print_name:  ${name}");
    super.print_name(name);
    print("Print SuperParent msg with super.msg: ${super.msg}");
  }
}

class SuperParent {
  String msg = "message from the parent class.";
  void print_name(String name){
    print("Print the Parent Name ${name}");
  }
}

void dartStaticKeyword() {
  // Initialize the static variable
  StaticMem.num =12;
  // Invoke the static method
  StaticMem.disp();

}

class StaticMem {
  static int num;
  static disp(){
    print("The value of num is ${StaticMem.num}");
  }
}

void dartInheritanceMethodOverriding() {
  Children c = new Children();
  c.print_name("Child 1");
}

class Children extends Parent{

  @override
  void print_name(String name) {
    print("Overriden Parent's name, with Children name as ${name}");
  }
}

class Parent {
  void print_name(String name){
    print("Name of Parent: ${name}");
  }
}

void dartClassMultiLevelClassInheritance() {
  var obj = new Leaf();
  obj.print_name();
}

class Leaf extends Child {
Leaf(){
  print("Leaf class constructor invoked");
}
}

class Child extends Root{
  Child(){
    print("Child class constructor invoked");
  }
}

class Root {
  Root(){
    print("Root class constructor invoked");
  }
  void print_name() {
    print("Calling from the Root Class");
  }
}

void dartClassInheritance() {
  var obj = new Circle();
  obj.cal_area();
}

class Circle extends Shape{

}

class Shape {
  void cal_area() {
    print("Calling calc area defined in the Shape class");
  }
}

void dartGetterAccessorSetterMutators() {
  Student s1 = new Student();

  s1.stud_age = 1;
  s1.stud_name = "Tony";

  print(s1.name);
  print(s1.stud_age);
  print(s1.age);

  s1.stud_age = 6;
  print(s1.name);
  print(s1.age);

}

class Student {
 String name;
 int  age;

 void set stud_age(int age){
   if(age <= 5){
     print("Age should be greater than 5: ${age}");
   }else{
     this.age = age;
   }
 }

 int get stud_age{
   return age;
 }

 void set stud_name(String name){
   this.name = name;
 }

 String get stud_name{
   return name;
 }
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