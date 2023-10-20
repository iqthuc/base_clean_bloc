import 'package:auto_route/auto_route.dart';
import 'package:base_clean_bloc/base/base_widget.dart';
import 'package:base_clean_bloc/features/example/data/model/player/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/index.dart';
import '../../domain/entity/player/player_entity.dart';
import '../bloc/example_bloc.dart';

@RoutePage()
class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends BaseState<ExamplePage, ExampleEvent, ExampleState, ExampleBloc> {
  @override
  void initState() {
    super.initState();
    bloc.pagingController.addPageRequestListener(
      (pageKey) => bloc.add(
        ExampleEvent.getPlayers(
          players: bloc.state.players,
          offset: pageKey,
        ),
      ),
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          const HeaderWidget(),
          Expanded(
            child: CustomListViewSeparated<Player>(
              separatorBuilder: (c, i) => const Divider(),
              controller: bloc.pagingController,
              builder: (c, item, i) => PlayerItem(
                data: item,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final total = context.select((ExampleBloc bloc) => bloc.state.players.length);
    return Container(
      decoration: BoxDecoration(color: Colors.greenAccent, border: Border.all()),
      padding: const EdgeInsets.all(16),
      child: Text("Count: $total"),
    );
  }
}

class PlayerItem extends StatelessWidget {
  final PlayerEntity data;
  const PlayerItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(data.firstName ?? ""),
          Text("Team: ${data.team}"),
        ],
      ),
    );
  }
}
