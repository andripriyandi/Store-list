import 'package:network/di/dependency.dart';

class Dependency {
  void initDependency() {
    // _registerDomain();
    _registerSharedLibrary();
  }

  void _registerSharedLibrary() {
    NetworkDependency();
    // NavigationDependency();
  }
}
