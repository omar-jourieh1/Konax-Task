import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konax_task/core/config/end_points.dart';
import 'package:konax_task/models/posts_details_model.dart';
import 'package:konax_task/models/posts_model.dart';
import 'package:konax_task/module/cubit/states.dart';

import '../../core/network/remote/dio_helper.dart';
import '../../models/posts_comments_model.dart';

class PostsCubit extends Cubit<PostsStates> {
  PostsCubit() : super(PostsInitalState());
  static PostsCubit get(context) => BlocProvider.of(context);

  List<PostModel>? postsModel;

  void getPostListData() async {
    emit(PostsLoadingState());
    print('Loading');

    await DioHelper.getData(
      url: posts,
    ).then((value) {
      postsModel =
          List<PostModel>.from(value.data.map((x) => PostModel.fromJson(x)));
      print(postsModel!.length.toString());

      emit(PostsSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(PostsErrorState(onError.toString()));
    });
  }

  List<PostsDetailsModel>? postsDetailsModel;

  void getPostDetailsData() async {
    emit(PostsLoadingState());

    await DioHelper.getData(
      url: postsDetails,
    ).then((value) {
      postsDetailsModel = List<PostsDetailsModel>.from(
          value.data.map((x) => PostsDetailsModel.fromJson(x)));
      print(postsDetailsModel!.length.toString());

      emit(PostsSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(PostsErrorState(onError.toString()));
    });
  }

  List<PostsCommentsModel>? postsCommentsModel;

  void getPostComments() async {
    emit(PostsLoadingState());

    await DioHelper.getData(
        url: postsComments, query: {'_page': 1, '_limit': 2}).then((value) {
      postsCommentsModel = List<PostsCommentsModel>.from(
          value.data.map((x) => PostsCommentsModel.fromJson(x)));
      print(postsCommentsModel!.length.toString());

      emit(PostsSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(PostsErrorState(onError.toString()));
    });
  }
}
