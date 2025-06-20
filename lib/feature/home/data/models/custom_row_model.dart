class CustomRowModel {
  final String title;
  final String subtitle;
  void Function()? onPressed;

  CustomRowModel({required this.title, required this.subtitle, this.onPressed});
}
