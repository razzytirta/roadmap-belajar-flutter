import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_50/model/user.dart';

abstract class UserEvent {}

class FetchUser extends UserEvent {
  final int userId;
  FetchUser(this.userId);
}

abstract class UserState {}

class UninitializedUser extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final User user;
  UserLoaded(this.user);
}

class UserError extends UserState {
  final String message;
  UserError(this.message);
}

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UninitializedUser()) {
    on<FetchUser>(_onfetchUser);
  }
  Future<void> _onfetchUser(FetchUser event, Emitter<UserState> emit) async {
    emit(UserLoading());

    try {
      User user = await User.getUserFromAPI(event.userId);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError("Failed to fetch user data"));
    }
  }
}
