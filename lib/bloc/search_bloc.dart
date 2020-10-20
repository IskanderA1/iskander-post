import 'package:news_app_bloc/model/article_response.dart';
import 'package:news_app_bloc/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc{
  final NewRepository _repository = NewRepository();
  final BehaviorSubject<ArticleResponse> _subject = BehaviorSubject<ArticleResponse>();


  search(String searchValue) async{
    ArticleResponse response = await _repository.search(searchValue);
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;
}

final searchBloc = SearchBloc();