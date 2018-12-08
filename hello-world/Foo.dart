library foo_lib;

import 'dart:math';


class Foo {
  // class name can be a symbol
  m1() {
    // method name can be a symbol
    print("Inside m1");
  }
  m2() {
    print("Inside m2");
  }
  m3() {
    print("Inside m3");
  }

}

//import statement after the libaray statement
int add(int firstNumber,int secondNumber){
  print("inside add method of Calculator Library ") ;
  return firstNumber+secondNumber;
}
int modulus(int firstNumber,int secondNumber){
  print("inside modulus method of Calculator Library ") ;
  return firstNumber%secondNumber;
}
int random(int no){
  return new Random().nextInt(no);
}