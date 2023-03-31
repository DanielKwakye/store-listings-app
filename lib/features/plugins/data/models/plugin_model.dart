class PluginModel {

  final String title;
  final String subTitle;
  final String icon;
  final bool enabled;
  final String category;

  PluginModel({required this.title, required this.subTitle, required this.icon, this.enabled = true, this.category = 'general'});

}