import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/components/index.dart';
import 'package:flutter_template/presentation/providers/index.dart';
import 'package:flutter_template/presentation/screens/follow/follow_detail_screen.dart';
import 'package:provider/provider.dart';

class SearchFollowScreen extends StatefulWidget {
  @override
  _SearchFollowScreenState createState() => _SearchFollowScreenState();
}

class _SearchFollowScreenState extends State<SearchFollowScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final followProvider = context.read<FollowProvider>();
    if (_searchController.text.isEmpty) {
      followProvider.clearResults();
    } else {
      followProvider.clearResults();
      followProvider.getMyFollows(_searchController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Seguimiento del Vehiculo'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Codigo de Seguimiento',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Consumer<FollowProvider>(
              builder: (context, followProvider, child) {
                if (followProvider.isLoading) {
                  return const CircularProgressIndicator();
                }
                if (followProvider.followList.isEmpty) {
                  return const Text('No hay resultados');
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: followProvider.followList.length,
                    itemBuilder: (context, index) {
                      final follow = followProvider.followList[index];
                      return GestureDetector(
                        onTap: () async {
                          final followDetailProvider =
                              context.read<FollowDetailProvider>();
                          await followDetailProvider
                              .getFollow(follow.idServicio.toString());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FollowDetailsScreen(
                                    followDetail:
                                        followDetailProvider.followDetail)),
                          );
                        },
                        child: FollowTile(
                          nombreServicio: follow.nombreServicio,
                          fechaFinServicio: follow.fechaFinServicio,
                          fechaInicioServicio: follow.fechaInicioServicio,
                          matriculaVehiculo: follow.matriculaVehiculo,
                          estadoServicio: follow.estadoServicio,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
