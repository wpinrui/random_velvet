import 'dart:math';

class RedVelvet {
  static Member irene = Member(
    imageString: 'irene.jpg',
    link: 'https://www.instagram.com/renebaebae/',
    name: 'Irene',
  );
  static Member seulgi = Member(
    imageString: 'seulgi.jpg',
    link: 'https://www.instagram.com/hi_sseulgi/',
    name: 'Seulgi',
  );
  static Member wendy = Member(
    imageString: 'wendy.jpg',
    link: 'https://www.instagram.com/todayis_wendy/',
    name: 'Wendy',
  );
  static Member joy = Member(
    imageString: 'joy.jpg',
    link: 'https://www.instagram.com/_imyour_joy/',
    name: 'Joy',
  );
  static Member yeri = Member(
    imageString: 'yeri.jpg',
    link: 'https://www.instagram.com/yerimiese/',
    name: 'Yeri',
  );
  static List<Member> members = [
    RedVelvet.irene,
    RedVelvet.joy,
    RedVelvet.seulgi,
    RedVelvet.joy,
    RedVelvet.wendy
  ];
  static List<Member> generateRandomPair() {
    var random = Random();
    var first = members[random.nextInt(members.length)];
    var remainingMembers = members.where((member) => member != first).toList();
    var second = remainingMembers[random.nextInt(remainingMembers.length)];
    return [first, second];
  }

  static List<Member> changeFirstMember(List<Member> current) {
    var random = Random();
    var second = current[1];
    var remainingMembers = members.where((member) => member != second).toList();
    var first = remainingMembers[random.nextInt(remainingMembers.length)];
    return [first, second];
  }

  static List<Member> changeSecondMember(List<Member> current) {
    var random = Random();
    var first = current[0];
    var remainingMembers = members.where((member) => member != first).toList();
    var second = remainingMembers[random.nextInt(remainingMembers.length)];
    return [first, second];
  }
}

class Member {
  String imageString;
  String link;
  String name;
  Member({required this.imageString, required this.link, required this.name});
}
