import 'package:dartz/dartz.dart';
import 'package:terminal_project/src/history/data/models/history_model.dart';
import 'package:terminal_project/src/login/data/models/error_model.dart';
import 'package:terminal_project/src/login/domain/services/api_helper.dart';

class HistoryService {
  Future<Either<Failure, History>> getHistory() async {
    return await Task<History>(
      () => ApiClient.instance.getHistory(),
    )
        .attempt()
        .map(
          (a) => a.leftMap(

            (l) {
              print(l);
             return ErrorMapper.mapError(l);
            }
          ),
        )
        .run();
  }
}
