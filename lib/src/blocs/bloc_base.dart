import 'package:exampletododevindo/src/models/model_base.dart';
import 'package:exampletododevindo/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class BaseBloc {
  final _repository = Repository();
  final _listFetcher = PublishSubject<BaseModels>();
  // final _title = BehaviorSubject<String>();
  // final _id = BehaviorSubject<String>();

  Observable<BaseModels> get allList => _listFetcher.stream;
  // Function(String) get updateTitle => _title.sink.add;
  // Function(String) get getId => _id.sink.add;

  fetchAllList() async {
    BaseModels mList = await _repository.fetchAllList();
    _listFetcher.sink.add(mList);
  }

  // addSaveTodo() {
  //   _repository.addSaveTodo(_title.value);
  // }

  // updateTodo() {
  //   print(_id.value);
  //   _repository.updateSaveTodo(_id.value);
  // }
  

  dispose(){
    // _title.close();
    // _id.close();
    _listFetcher.close();
  }
}

final bloc = BaseBloc();
