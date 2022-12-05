// import 'package:flutter_bloc/flutter_bloc.dart';

// abstract class AllUserEvent { }

// abstract class CurrentUserEvent extends AllUserEvent { }

// class SearchState{
//   bool showAll;
//   SearchState(this.showAll);
// }


// class ManageFilterBloc extends Bloc<AllUserEvent, SearchState>{
//   ManageFilterBloc():super(SearchState(true)){
//     on<AllUserEvent>((event, emit) {
//       emit(SearchState(true));
//     });

//     on<CurrentUserEvent>((event, emit) {
//       emit(SearchState(false));
//     });
//   }
// }