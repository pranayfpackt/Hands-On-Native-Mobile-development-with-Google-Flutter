import 'dart:io';
import 'dart:isolate';

Future<void> longRunningOperation(Future port) async {
  for (int i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    print("index: $i");
  }  
}

main() {
  print("start of long running operation");

  Isolate.spawn(longRunningOperation, null);

  print("continuing main body");

  for (int i = 10; i < 15; i++) {  
    sleep(Duration(seconds: 1));
    print("index from main: $i");
  }

  print("end of main");
}
