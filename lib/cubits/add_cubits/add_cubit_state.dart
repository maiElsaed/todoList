class AddCubitState{

}
class LoadingState extends AddCubitState{

}
class initialState extends AddCubitState{

}
class SuccessState extends AddCubitState{

}
class FailureState extends AddCubitState{
      final String message;
      FailureState({required this.message});
}
