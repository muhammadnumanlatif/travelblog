import 'package:flutter/material.dart';

import 'models/travel.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, this.travel}) : super(key: key);
  final Travel? travel;
  final double? expandableHeight = 300;
  final double? roundedContainerHeight = 50;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                _buildSliverHead(),
              SliverToBoxAdapter(
                child: _buildDetail(context),
              ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 15,
                right: 15,
                left: 15,
              ),
              child: SizedBox(
                height: kToolbarHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(
                        Icons.arrow_back,
                    color: Colors.white,
                    ),),
                    IconButton(onPressed: (){}, icon: Icon(
                        Icons.menu,
                      color: Colors.white,
                    ),),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliverHead() {
    return SliverPersistentHeader(
        delegate: DetailSliverDelegate(
        travel: travel,
      expandableHeight: expandableHeight,
            roundedContainerHeight: roundedContainerHeight,
    ));
  }


 Widget _buildDetail(context){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildUserInfo(context),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Material(
              color: Colors.transparent,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',

                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(
                  color: Colors.teal.shade200,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                    height: 1.5,
                ),
              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  'View All',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: FeaturedWidget(),
            ),

          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Material(
              color: Colors.transparent,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',

                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(
                  color: Colors.teal.shade200,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ),

          ),
        ],
      ),
    );
  }

 Widget _buildUserInfo(context){
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      vertical: 5,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              '${travel!.url}',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  color: Colors.transparent,
                  child: Text(
                    '${travel!.location}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(
                      fontSize: 15,
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: Text(
                    '${travel!.name}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Icon(
            Icons.share,
            color: Colors.green,
          ),
        ],
      ),
    );
 }

}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final Travel? travel;
  final double? expandableHeight;
  final double? roundedContainerHeight;
  DetailSliverDelegate({
      this.travel, this.expandableHeight, this.roundedContainerHeight,
});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.80,
          child: Image.asset(
            '${travel!.url}',
            width: MediaQuery.of(context).size.width,
            height: expandableHeight,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: expandableHeight! - roundedContainerHeight! - shrinkOffset,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: roundedContainerHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
        ),
        Positioned(
            top: expandableHeight! - shrinkOffset - 120,
            left: 30,
            child: Column(children: [
              Material(
                color: Colors.transparent,
                child: Text(
                  '${travel!.location}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Text(
                  '${travel!.name}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            ),
        ),
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => expandableHeight!;

  @override
  // TODO: implement minExtent
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
   return true;


  }
}

class FeaturedWidget extends StatelessWidget {
   FeaturedWidget({Key? key}) : super(key: key);
final _list = Travel.mostPopular();
  @override
  Widget build(BuildContext context) {
return ListView.separated(
scrollDirection: Axis.horizontal,
    separatorBuilder: (context,index)=>SizedBox(width: 5,), itemCount: _list.length,
    itemBuilder: (context, index) {
      var travel = _list[index];
      return GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(travel: travel),
            ),
          );
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                '${travel.url}',
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 15,
              child: Column(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      '${travel.location}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      '${travel.name}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  },
);
  }
}
