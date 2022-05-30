import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/package.dart';
import 'package:fortnite_app/app/modules/home/presenter/states/package_state.dart';
import 'package:fortnite_app/app/modules/home/presenter/stores/home_store.dart';
import 'package:fortnite_app/app/modules/home/presenter/ui/widgets/package_card.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();

  @override
  void initState() {
    reaction<IPackageState>((_) => store.state, (state) {
      String? message;
      Color color = Colors.grey;

      if (state is PackageSuccess) {
        color = Colors.green;
        message = "Itens carregados com sucesso";
      } else if (state is PackageError) {
        color = Colors.red;
        message = "Falha ao carregar itens";
      }

      if (message != null) {
        ScaffoldMessenger.maybeOf(context)?.hideCurrentSnackBar();
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(
          content: Text(message),
          backgroundColor: color,
          duration: const Duration(seconds: 2),
        ));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fortnite - Itens'),
      ),
      body: Observer(
        builder: (context) {
          if (store.state is PackageLoading) {
            return const CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: store.packages.length,
              itemBuilder: (context, index) {
                Package package = store.packages[index];
                return PackageCard(package: package);
              },
            );
          }
        },
      ),
    );
  }
}