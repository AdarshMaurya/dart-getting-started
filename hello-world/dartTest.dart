library dart_test;

import "package:test/test.dart";

int Add(int x, int y) {
  return x + y;
}

int Sub(int x, int y) {
  return x - y;
}

void additionTest() {
  test('Addition Test', () {
    var expected = 50;
    var actual = Add(20, 30);

    expect(actual, expected);
  });
}

void subTest() {
  test('Substraction Test', () {
    var expected = -10;
    var actual = Sub(20, 30);

    expect(actual, expected);
  });
}

void groupStringTest() {
  group("String", () {

    test("test on split() method of string class", () {
      var string = "foo,bar,baz";
      expect(string.split(","), equals(["foo", "bar", "baz"]));
    });

    test("test on trim() method of string class", () {
      var string = "  foo ";
      expect(string.trim(), equals("foo"));
    });
  });
}
