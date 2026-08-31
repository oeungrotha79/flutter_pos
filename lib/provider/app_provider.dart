import 'package:pos_mobile/provider/home_provider.dart';
import 'package:provider/provider.dart';

final providers = [
  ChangeNotifierProvider(create: (_) => HomeProvider())

];