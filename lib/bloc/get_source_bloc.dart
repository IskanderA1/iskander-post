import 'package:news_app_bloc/model/source_response.dart';
import 'package:news_app_bloc/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class GetSourceBloc{

  final NewRepository _repository = NewRepository();
  final BehaviorSubject<SourceResponse> _subject =
  BehaviorSubject<SourceResponse>();

  getSources() async{
    SourceResponse response = await _repository.getSources();
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }
  BehaviorSubject<SourceResponse> get subject => _subject;
}

final getSourceBloc = GetSourceBloc();