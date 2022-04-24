import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/avatar.dart';
import '../services/apiRepository.dart';
import 'repository.dart';
import 'starred.dart';
import '../styles/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  ScrollController? _scrollViewController;

  bool _init = true;
  bool _isLoading = true;
  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoading = await Provider.of<RepositoryState>(context).getRepos();
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
    _tabController?.dispose();
    _scrollViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final repositorysList = Provider.of<RepositoryState>(context).repos;
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
                                style: TextStyle(
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
                        child: const Center(
                            child: Text("100",
                                style: TextStyle(
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
                children: [Repository(), Starred()],
              ),
            )
          ]),
        ));
  }
}
