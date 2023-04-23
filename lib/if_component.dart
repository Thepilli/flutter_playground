import 'dart:developer';

Developer theDeveloper = Developer();

class Developer {
  bool available = true;
  bool fullStack = true;
  bool googleEverything = true;
}

void start() {
  String message = isThePerfectDev();
  log(message);
}

String isThePerfectDev() {
  String message = 'Perfect developer!';
  if (theDeveloper.available == false) {
    message = 'Not available!';
  } else if (theDeveloper.googleEverything == false) {
    message = 'Not full stack!';
  } else if (theDeveloper.fullStack == false) {
    message = 'Not google everything!';
  }
  return message;
}
