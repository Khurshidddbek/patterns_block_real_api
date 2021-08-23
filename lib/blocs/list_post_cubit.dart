import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_block_real_api/model/contact_model.dart';
import 'package:patterns_block_real_api/services/http_service.dart';

import 'list_post_state.dart';

class ListPostCubit extends Cubit<ListPostState> {
  ListPostCubit() : super(ListPostInit());
  
  apiPostList() async {
    emit(ListPostLoading());
    
    final response = await Network.GET(Network.API_LIST);
    print('\n Response : $response');
    
    if (response != null) {
      emit(ListPostLoaded(posts: Network.parseContactList(response)));
    } else {
        emit(ListPostError(error: "Could'nt fetch contacts"));
      }
  }

  apiPostDelete(Contact contact) async {
    emit(ListPostLoading());

    final response = await Network.DEL(Network.API_DELETE + contact.id.toString());
    print('\n Response : $response');

    if (response != null) {
      apiPostList();
    } else {
      emit(ListPostError(error: "Couldn't delete contact"));
    }
  }
}