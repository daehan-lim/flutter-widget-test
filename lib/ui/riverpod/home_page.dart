import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      // Use the Consumer widget when accessing the ViewModel
      body: Consumer(
        // Because in the builder property of Consumer,
        // WidgetRef is passed,
        //
        // and WidgetRef allows access to the Notifier,
        // i.e., the ViewModel
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          // Access the state managed by the ViewModel:
          //
          // If you pass the ViewModelProvider into ref.watch,
          // it returns the state of the ViewModel
          //
          // Also, whenever the ViewModel updates,
          // the builder of the Consumer widget is called again
          HomeState homeState = ref.watch(homeViewModelProvider);
          // HomeState homeStateStatic = ref.read(homeViewModelProvider);

          // There’s also the ref.read function, but if you read state
          // using read, the builder won't be recalled even if the
          // state updates
          // HomeState homeState = ref.read(homeViewModelProvider);

          return Center(
            child: Column(
              children: [
                Text('Name: ${homeState.user?.name ?? ""}'),
                Text('Age: ${homeState.user?.name ?? ""}'),
                if (homeState.fetchTime != null)
                  Text('Data fetched at: ${homeState.fetchTime}'),
                GestureDetector(
                  onTap: () {
                    // When directly accessing the ViewModel,
                    // add `.notifier` to homeViewModelProvider
                    //
                    // Since the ViewModel itself won’t update,
                    // use read
                    HomeViewModel homeViewModel = ref.read(
                      homeViewModelProvider.notifier,
                    );
                    homeViewModel.getUserInfo();
                  },
                  child: Text('Fetch Info'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
