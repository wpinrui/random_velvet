import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

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
    var first = current[0];
    var second = current[1];
    var remainingMembers =
        members.where((member) => member != first && member != second).toList();
    first = remainingMembers[random.nextInt(remainingMembers.length)];
    return [first, second];
  }

  static List<Member> changeSecondMember(List<Member> current) {
    var random = Random();
    var first = current[0];
    var second = current[1];
    var remainingMembers =
        members.where((member) => member != first && member != second).toList();
    second = remainingMembers[random.nextInt(remainingMembers.length)];
    return [first, second];
  }

  static void launchInstagramURL(Member member) async {
    Uri uri = Uri.parse(member.link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ${member.link}';
    }
  }
}

class Member {
  String imageString;
  String link;
  String name;
  Member({required this.imageString, required this.link, required this.name});
}
