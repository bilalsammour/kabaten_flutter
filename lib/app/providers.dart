import 'package:flutter/material.dart';
import 'package:kabaten/business/auth/auth_view_model.dart';
import 'package:kabaten/business/profile/profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> buildProviders(BuildContext context) => [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileViewModel(),
        ),
      ];
}
