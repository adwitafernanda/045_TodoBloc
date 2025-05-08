import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todoapp/model/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TodoEventAdd>((event, emit) {
      final currentState = state;
      if(currentState is TodoLoaded){
        final List<Todo> updatedTodos = List.from(currentState.todos);
        updatedTodos.add(
          Todo(title: event.title, date: event.date, isCompleted: false)
        );
        emit(
          TodoLoaded(todos: updatedTodos, selectedDate: currentState.selectedDate)
        );
      }
    });
    on<TodoSelectDate>((event, emit) {
      final currentState = state;
      if(currentState is TodoLoaded){
        emit(TodoLoaded(todos: currentState.todos, selectedDate: event.date));
      }
    });
    on<TodoEventCompleted>((event, emit) {
      final currentState = state;
      if(currentState is TodoLoaded){
        final List<Todo> updatedTodos = List.from(currentState.todos);
        if(event.index >= 0 && event.index < updatedTodos.length){
          updatedTodos[event.index] = Todo(title: updatedTodos[event.index].title, date: updatedTodos[event.index].date, isCompleted: !updatedTodos[event.index].isCompleted);
          emit(
            TodoLoaded(todos: updatedTodos, selectedDate: currentState.selectedDate)
          );
        }
      }
    });

  }
}