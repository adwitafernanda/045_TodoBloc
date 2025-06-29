part of 'todo_bloc.dart';


sealed class TodoEvent {

}

final class TodoEventStarted extends TodoEvent {}


final class TodoEventAdd extends TodoEvent {
  final String title;
  final DateTime date;
  TodoEventAdd({required this.title, required this.date});
}

final class TodoEventCompleted extends TodoEvent {
  final int index;
  TodoEventCompleted({required this.index});
}

final class TodoSelectDate extends TodoEvent {
  final DateTime date;
  TodoSelectDate({required this.date});
}