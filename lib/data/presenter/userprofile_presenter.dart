import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_interceptor/data/repos/api_repository.dart';

import '../../base/view_state.dart';

class UserProfilePresenter{

  final StreamController<ViewState> _controller=StreamController.broadcast();
  Stream<ViewState> get getUserDataStream => _controller.stream;

  void getUser()
  {
    _controller.add(ViewState.loading());
    ApiRepository().getUser().then((value) {
      _controller.add(ViewState.completed(value));
    }).onError((err, stackTrace) {
      _controller.add(ViewState.error("Something went wrong"));
      if(kDebugMode)
      {
        print(err.toString());
      }

    });
  }
}
