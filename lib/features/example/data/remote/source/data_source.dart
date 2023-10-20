import 'package:base_clean_bloc/features/example/data/model/player/player.dart';

import '../../../../../base/network/models/base_data.dart';

abstract class DataSource {
  Future<BaseListData<Player>> getData({
    required int offset,
    required int limit,
  });
}
