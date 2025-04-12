import 'package:first_app/ui/riverpod/user.dart';
import 'package:first_app/ui/riverpod/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Define the state class used in HomePage
class HomeState {
  /// If user info has not been fetched yet,
  /// User will be null!
  User? user;

  /// Time the data was fetched.
  /// Also null initially
  DateTime? fetchTime;

  HomeState({required this.user, required this.fetchTime});
}

// 2. Implement ViewModel by extending Notifier
// Notifier: Manages (stores, updates) state,
//          and notifies subscribed widgets when
//          an update occurs
//
// When extending Notifier, specify the type of
// state this ViewModel will manage using generics
class HomeViewModel extends Notifier<HomeState> {
  // 3. build function: initializes the initial state of ViewModel
  @override
  HomeState build() {
    return HomeState(
      user: null, // initial state is null
      fetchTime: null,
    );
  }

  /// 4. Implement logic to fetch user info from UserRepository
  ///  and update the state
  void getUserInfo() async {
    final userRepository = UserRepository();
    final User user = await userRepository.getUser();

    // Do not use like this — Notifier requires a new state object
    // to notify widgets
    //
    // state.user = user;
    // state.fetchTime = DateTime.now();
    //
    // Assign a new object to state like this!
    state = HomeState(user: user, fetchTime: DateTime.now());
  }
}

// 5. In Riverpod, you don’t directly call the ViewModel
//    constructor (HomeViewModel()) in the widget
//
//    Riverpod manages it internally
//
//    When a widget like A uses HomeViewModel for the first time,
//    a new HomeViewModel is created
//
//    => If another widget like B uses HomeViewModel,
//       Riverpod returns the already-created instance
//
// Usage: Use NotifierProvider class to provide HomeViewModel
//        When extending NotifierProvider, specify the ViewModel class
//        type and the state class the ViewModel manages
final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
