

import 'package:news_app_bloc/model/article_response.dart';
import 'package:news_app_bloc/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class GetHotNewsBloc{
  final NewRepository _repository = NewRepository();
  final BehaviorSubject<ArticleResponse> _subject =
  BehaviorSubject<ArticleResponse>();

  getHotNews() async{
    ArticleResponse response = await _repository.getHotNews();
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;

}

final getHotNewsBloc = GetHotNewsBloc();