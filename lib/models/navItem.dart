class NaveItem {
  final int id;
  final String icon;
  final String label;

  NaveItem({required this.label, required this.id, required this.icon});
}

List<NaveItem> navItems = [
  NaveItem(id: 0, label: "미션 홈", icon: "assets/icons/home.svg"),
  NaveItem(id: 1, label: "친구목록", icon: "assets/icons/square.svg"),
  NaveItem(id: 2, label: "알림", icon: "assets/icons/bell.svg"),
  //NaveItem(id: 3, label: "캠페인", icon: "assets/icons/loupe.svg"),
  NaveItem(id: 3, label: "마이페이지", icon: "assets/icons/user.svg"),
];