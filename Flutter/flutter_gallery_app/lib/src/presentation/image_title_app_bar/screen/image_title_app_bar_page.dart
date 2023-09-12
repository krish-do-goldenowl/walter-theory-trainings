import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_app/src/presentation/image_title_app_bar/widgets/custom_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ImageTitleAppBarPage extends StatefulWidget {
  const ImageTitleAppBarPage({super.key});

  @override
  State<ImageTitleAppBarPage> createState() => _ImageTitleAppBarPageState();
}

class _ImageTitleAppBarPageState extends State<ImageTitleAppBarPage>
    with TickerProviderStateMixin {
  final _controller = ScrollController();
  late final TabController tabController;
  bool isTop = false;

  @override
  void initState() {
    _controller.addListener(() {
      setState(() => isTop = _controller.position.pixels >=
          300 - 2 * AppBar().preferredSize.height);
    });
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        controller: _controller,
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: TabBar(
                    controller: tabController,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    dividerColor: Colors.grey,
                    labelColor: Colors.red,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.red,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: const [
                      Tab(text: "Description"),
                      Tab(text: "Episodes")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      _buildRate(),
                      const SizedBox(height: 10),
                      const Text(
                        "Until recently, the prevailing view assumed lorem ipsum was born as a nonsense text. “It's not Latin, though it looks like it, and it actually says nothing,” Before & After magazine answered a curious reader, “Its ‘words’ loosely approximate the frequency with which letters occur in English, which is why at a glance it looks pretty real.” As Cicero would put it, “Um, not so fast.” The placeholder text, beginning with the line “Lorem ipsum dolor sit amet, consectetur adipiscing elit”, looks like Latin because in its youth, centuries ago, it was Latin.",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      _buildRank(),
                      const SizedBox(height: 15),
                      _buildAvatar(),
                      const SizedBox(height: 15),
                      _buildInfo(),
                      const SizedBox(height: 15),
                      _buildComment(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComment() {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              "Hot Comments",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Spacer(),
            Text("1215 comments", style: TextStyle(color: Colors.grey)),
            Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey, size: 15)
          ],
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User $index",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "This is comment $index",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildRate() {
    return Row(
      children: [
        const Text(
          "Update Everyday",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const Spacer(),
        ...List.generate(
          5,
          (index) => const Icon(Icons.star, color: Colors.yellow),
        ),
        const SizedBox(width: 5),
        const Text(
          "5",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(FontAwesomeIcons.penToSquare, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildAvatar() {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(
            "assets/images/logo.png",
            height: 50,
            width: 50,
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          "Haotoon",
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  Widget _buildRank() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(FontAwesomeIcons.medal, color: Colors.orange),
              SizedBox(width: 5),
              Text(
                "Top Fantasy No.15",
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.orange,
              )
            ],
          ),
        ),
        const SizedBox(width: 15),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            "Modem",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget _buildInfo() {
    return Column(
      children: [
        const Divider(color: Colors.grey, endIndent: 5, indent: 5),
        _buildInfoItem(
            "8845 gifts", "Gift", FontAwesomeIcons.gift, Colors.yellow),
        const Divider(color: Colors.grey, endIndent: 5, indent: 5),
        _buildInfoItem("509 Votes", "Vote", FontAwesomeIcons.gifts, Colors.red),
        const Divider(color: Colors.grey, endIndent: 5, indent: 5),
        _buildTopFan(),
      ],
    );
  }

  Widget _buildTopFan() {
    return Row(
      children: [
        const Icon(FontAwesomeIcons.rankingStar, color: Colors.orange),
        const SizedBox(width: 20),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Top Fans",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "79652 suport in total",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        const Spacer(),
        ...List.generate(
          3,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ClipOval(
              child:
                  Image.asset("assets/images/logo.png", height: 30, width: 30),
            ),
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.grey,
          size: 15,
        ),
      ],
    );
  }

  Widget _buildInfoItem(
    String title,
    String text,
    IconData icon,
    Color iconColor,
  ) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 20),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(text),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(FontAwesomeIcons.download),
        ),
      ],
      backgroundColor: isTop ? Colors.black : Colors.transparent,
      elevation: 0,
      pinned: true,
      centerTitle: true,
      stretch: true,
      expandedHeight: 300.0,
      title: AnimatedOpacity(
        opacity: !isTop ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: const Text("Super Lucky Mr.Fortune Teller"),
      ),
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        expandedTitleScale: 1.0,
        centerTitle: false,
        titlePadding: const EdgeInsets.all(16),
        title: _titleWidget(),
        background: const Image(
          image: AssetImage('assets/images/cover.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return AnimatedOpacity(
      opacity: isTop ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Super Lucky Mr.Fortune Teller"),
          SizedBox(height: 8),
          Row(
            children: [
              CustomCard(title: "Comedy"),
              SizedBox(width: 10),
              CustomCard(title: "System"),
              SizedBox(width: 10),
              CustomCard(title: "Counterattack"),
              Spacer(),
              Icon(FontAwesomeIcons.fire, color: Colors.yellow),
              Text("707.71K", style: TextStyle(fontSize: 12)),
              Spacer(),
              Icon(FontAwesomeIcons.thumbsUp, color: Colors.red),
              Text("20.51K", style: TextStyle(fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }
}
