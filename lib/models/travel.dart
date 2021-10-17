
class Travel {
 final String? name;
 final String? location;
 final String? url;

  Travel({
    this.name,
    this.location,
    this.url,
  });

  static List<Travel> travelBlog(){
    return [
      Travel(name:'Top1',location: 'Location1', url: 'assets/images/top1.jpg' ),
      Travel(name:'Top2',location: 'Location2', url: 'assets/images/top2.jpg' ),
      Travel(name:'Top3',location: 'Location3', url: 'assets/images/top3.jpg' ),
      Travel(name:'Top4',location: 'Location4', url: 'assets/images/top4.jpg' ),
    ];
  }

 static List<Travel> mostPopular(){
   return [
     Travel(name:'Top5',location: 'Location5', url: 'assets/images/bottom1.jpg' ),
     Travel(name:'Top6',location: 'Location6', url: 'assets/images/bottom2.jpg' ),
     Travel(name:'Top7',location: 'Location7', url: 'assets/images/bottom3.jpg' ),
     Travel(name:'Top8',location: 'Location8', url: 'assets/images/bottom4.jpg' ),
   ];
 }

}