import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fashion_connect/repositories/category_repository.dart';
import 'package:meta/meta.dart';

// CATEGORY FORM STATE
abstract class CategoryFormState extends Equatable {
  CategoryFormState([List props = const []]) : super(props);
}

class CategoryFormLoading extends CategoryFormState {
  @override
  String toString() => 'CategoryFormLoading';
}

class CategoryFormInitial extends CategoryFormState {
  @override
  String toString() => 'CategoryFormInitial';
}

class CategoryFormSuccess extends CategoryFormState {
  final String categoryId;

  CategoryFormSuccess({@required this.categoryId}) : super([categoryId]);

  @override
  String toString() => 'CategoryFormSuccess';
}

class CategoryFormFailure extends CategoryFormState {
  final String error;

  CategoryFormFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'CategoryFormFailure';
}

// CATEGORY FORM EVENT
abstract class CategoryFormEvent extends Equatable {
  CategoryFormEvent([List props = const []]) : super(props);
}

class CategoryFormSubmit extends CategoryFormEvent {
  final String title;
  final String description;

  CategoryFormSubmit({@required this.title, @required this.description})
      : super([title, description]);
}

// CATEGORY FROM BLOC
class CategoryFormBloc extends Bloc<CategoryFormEvent, CategoryFormState> {
  final CategoryRepository categoryRepository;

  CategoryFormBloc({@required this.categoryRepository});

  @override
  void onTransition(
      Transition<CategoryFormEvent, CategoryFormState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  CategoryFormState get initialState => CategoryFormInitial();

  @override
  Stream<CategoryFormState> mapEventToState(
      CategoryFormState currentState, CategoryFormEvent event) async* {
    if (event is CategoryFormSubmit) {
      yield CategoryFormLoading();

      try {
        String categoryId = await categoryRepository.createCategory(
            title: event.title, description: event.description);
        yield CategoryFormSuccess(categoryId: categoryId);
      } catch (e) {
        yield CategoryFormFailure(error: e.toString());
      }
    }
  }
}
