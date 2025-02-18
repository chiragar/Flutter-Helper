// 3 Pillars of Getx
// 1. State Management
// 2. Route Management
// 3. Dependency Management

// Getx Utils
// 1. Internationalization (Multi-lingual support)
// 2. Themes
// 3. Popups, Bottom Sheets, Dialogs (without context)

// State Management

// Simple State Management
// Simple and easy, works like SetState()
class Controller extends GetxController {
  int counter = 0;

  void increment() {
    counter++;
    update(); // Use update() to refresh the UI when increment is called
  }
}

// Using GetBuilder for UI update
GetBuilder<Controller>(
  init: Controller(),
  builder: (controller) => Text('${controller.counter}')
)

// Initialize your controller only the first time. 
// After that, use ReBuilder for the same controller without using 'init'.

// Reactive State Management

// Reactive programming can be complex in other state management libraries. 
// But with GetX, it's simple and doesn't require extra boilerplate like StreamControllers, StreamBuilder, etc.

var name = 'Jonatas Borges'.obs;

// In the UI, to observe and update the UI when the value changes:
Obx(() => Text("${controller.name}"))

// Example with multiple reactive variables
final count1 = 0.obs;
final count2 = 0.obs;

int get sum => count1.value + count2.value;

GetX<Controller>(
  builder: (controller) {
    print("count 1 rebuild");
    return Text('${controller.count1.value}');
  },
),
GetX<Controller>(
  builder: (controller) {
    print("count 2 rebuild");
    return Text('${controller.count2.value}');
  },
),
GetX<Controller>(
  builder: (controller) {
    print("count 3 rebuild");
    return Text('${controller.sum}');
  },
),