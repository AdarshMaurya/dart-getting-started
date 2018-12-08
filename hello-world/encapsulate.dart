library loggerlib;

//Dart scripts can prefix identifiers with an underscore ( _ ) to mark its components private.
// Simply put, Dart libraries can restrict access to its content by external scripts.

void _log(msg){
  print("Log method called in loggerlib msg :$msg");
}

void log(msg){
  print("Log method called in loggerlib msg :$msg");
}