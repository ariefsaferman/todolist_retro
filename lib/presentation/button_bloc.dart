import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/presentation/button_event.dart';
import 'package:todolist/presentation/button_state.dart';

class ButtonBloc {
  var _todos = [];
  String _input = "";

  final _todosStateController = StreamController<String>();

  StreamSink<String> get _inTodos => _todosStateController.sink;

  Stream<String> get todos => _todosStateController.stream;

  final _todosEventController = StreamController<ButtonEvent>();

  Sink<ButtonEvent> get buttonEventSink => _todosEventController.sink;

  ButtonBloc() {
    _todosEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(ButtonEvent event) {
    if (event is AddTodoEvent) {
      // _todos.add(_input);
      _inTodos.add(_input);
    }
  }

  void dispose() {
   _todosEventController.close();
   _todosStateController.close();
  }
}
