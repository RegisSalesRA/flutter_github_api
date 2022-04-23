// Scaffold(
//         appBar: AppBar(
//           backgroundColor: CustomColors.slateGreyTwo,
//           title: Row(
//             children: const [
//               FaIcon(FontAwesomeIcons.github),
//               Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: Text("Github profiles"),
//               )
//             ],
//           ),
//         ),
//         body: NestedScrollView(
//           controller: _scrollViewController,
//           headerSliverBuilder: (context, bool) => [
//             SliverAppBar(
//               backgroundColor: Colors.black,
//               bottom: TabBar(
//                 controller: _tabController,
//                 tabs: [
//                   Tab(text: "All"),
//                   Tab(text: "Living room"),
//                 ],
//               ),
//             ),
//           ],
//           body: TabBarView(
//             controller: _tabController,
//             children: [PageOne(), PageTwo()],
//           ),
//         ));
//   }
// }