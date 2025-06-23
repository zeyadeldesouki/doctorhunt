class PatientItemModel {
  final String image;
  final String title;
  final void Function()? onTap;

  PatientItemModel({required this.image, required this.title, this.onTap});
}
