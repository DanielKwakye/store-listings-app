import 'package:paperless_listings/features/plugins/data/models/plugin_model.dart';

final plugins = [
  PluginModel(title: 'About Section',
      subTitle: "Add an about section to your listings pages",
      icon: 'assets/img/about_plugin_icon.png',
      enabled: true
  ),
  PluginModel(title: 'Live Chat',
      subTitle: "Include a live chat functionality to your listings",
      icon: 'assets/img/chat_plugin_icon.png',
      enabled: false
  ),
  PluginModel(title: 'FAQ',
      subTitle: "Add FAQ section to your listings",
      icon: 'assets/img/faq_plugin_icon.png',
      enabled: false
  ),
  PluginModel(title: 'Reviews',
      subTitle: "Allow users to add reviews to your listings",
      icon: 'assets/img/reviews_plugin_icon.png',
      enabled: false
  ),
  PluginModel(title: 'Utilities',
      subTitle: "Add utilities/amenities section to your listings",
      icon: 'assets/img/ammenities_plugin_icon.png',
      enabled: false
  ),
  PluginModel(title: 'Shopping cart',
      subTitle: "This addes a shopping cart to your listings. Users can select products and pay for them",
      icon: 'assets/img/shoppinc_cart_plugin.png',
      enabled: true,
      category: 'unique'
  )
];