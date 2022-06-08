import 'package:adagri/widgets/searchInput.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/header.dart';
import '../services/apiGithubData.dart';
import '../widgets/listComponents.dart';
import '../styles/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final _serachControllerRepo = TextEditingController();
  final _serachControllerStarred = TextEditingController();
  TabController? _tabController;
  ScrollController? _scrollViewController;
  bool _init = true;
  List<dynamic> searchListRepositorio = [];
  List<dynamic> searchListStarred = [];

  @override
  void didChangeDependencies() async {
    if (_init) {
      Provider.of<RepositoryState>(context).getStarred();
      await Provider.of<RepositoryState>(context).getRepos();

      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
    _scrollViewController?.dispose();
    _serachControllerRepo;
    _serachControllerStarred;
  }

  @override
  Widget build(BuildContext context) {
    final repositorysList = Provider.of<RepositoryState>(context).repos;
    final starredsList = Provider.of<RepositoryState>(context).starredRepos;

    void searchFunction(valorInputSearch) {
      if (_serachControllerRepo.text.isEmpty ||
          _serachControllerRepo.text == "") {}
      setState(() {
        searchListRepositorio = [];
      });
      for (var iten in repositorysList) {
        if (iten.name!.toLowerCase().startsWith(valorInputSearch)) {
          setState(() {
            searchListRepositorio.add(iten);
          });
        }
      }
    }

    void searchFunction2(valorInputSearch) {
      if (_serachControllerStarred.text.isEmpty ||
          _serachControllerStarred.text == "") {}

      setState(() {
        searchListStarred = [];
      });
      for (var iten in starredsList) {
        if (iten.name!.toLowerCase().startsWith(valorInputSearch)) {
          setState(() {
            searchListStarred.add(iten);
          });
        }
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.slateGreyTwo,
          title: Row(
            children: const [
              FaIcon(FontAwesomeIcons.github),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Github profiles"),
              )
            ],
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            const Header(),
            TabBar(
              indicatorColor: CustomColors.rustyOrange,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: false,
              controller: _tabController,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Reposotorios'),
                      const SizedBox(width: 8),
                      Container(
                        width: 27.0,
                        height: 20.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: CustomColors.whiteTwo,
                        ),
                        child: Center(
                            child: Text(repositorysList.length.toString(),
                                style: const TextStyle(
                                    color: CustomColors.slateGreyTwo))),
                      )
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Starred'),
                      const SizedBox(width: 8),
                      Container(
                        width: 27.0,
                        height: 20.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: CustomColors.whiteTwo,
                        ),
                        child: Center(
                            child: Text(starredsList.length.toString(),
                                style: const TextStyle(
                                    color: CustomColors.slateGreyTwo))),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListComponent(
                    search: SearchInput(
                      search: (val) {
                        searchFunction(val);
                      },
                    ),
                    repositorios: searchListRepositorio.isEmpty
                        ? repositorysList
                        : searchListRepositorio,
                  ),
                  ListComponent(
                    search: SearchInput(
                      search: (val) {
                        searchFunction2(val);
                      },
                    ),
                    repositorios: searchListStarred.isEmpty
                        ? starredsList
                        : searchListStarred,
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
