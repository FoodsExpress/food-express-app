import 'package:zezi/common/model/cursor_pagination_model.dart';
import 'package:zezi/common/model/model_with_id.dart';
import 'package:zezi/common/model/pagination_params.dart';

abstract class IBasePaginationRepository<T extends IModelWithId>{
  Future<CursorPagination<T>> paginate({
    PaginationParams? paginationParams = const PaginationParams(),
  });
}