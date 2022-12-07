import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/navigation/navigation_bloc.dart';
import '../../pages/home/home_page.dart';

class CoreNavigator extends StatelessWidget {
  const CoreNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        // check state for other pages
  
        return const HomePage();
      }
    );
  }
}
