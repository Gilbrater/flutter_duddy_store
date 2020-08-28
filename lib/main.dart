import 'package:flutter/cupertino.dart';
import 'app.dart';

import 'package:provider/provider.dart';
import 'model/app_state_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppStateModel>(
      create: (_) => AppStateModel()..loadProducts(),
      child: DuddyStore(),
    ),
  );
}
