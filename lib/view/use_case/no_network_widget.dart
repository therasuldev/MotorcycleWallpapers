import 'package:flutter/material.dart';

// class NoNetworkWidget extends StatefulWidget {
//   const NoNetworkWidget({Key? key}) : super(key: key);

//   @override
//   State<NoNetworkWidget> createState() => _NoNetworkWidgetState();
// }

// class _NoNetworkWidgetState extends State<NoNetworkWidget> with StateMixin {
//   late final INetworkChangeManager _networkChange;
//   NetworkResult? _networkResult;
//   @override
//   void initState() {
//     _networkChange = NetworkChangeManager();
//     waitForScreen(() {
//       _networkChange.handleChangeNetwork((result) {
//         _updateView(result);
//       });
//     });
//     super.initState();
//   }

//   void fetchFirstResult() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       final result = await _networkChange.changeNetworkFirstTime();
//       _updateView(result);
//     });
//   }

//   void _updateView(NetworkResult result) {
//     setState(() {
//       _networkResult = result;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: _networkResult == NetworkResult.off
//               ? Image.asset('assets/no-internet.png')
//               : const SizedBox.shrink()),
//     );
//   }
// }

// mixin StateMixin<T extends StatefulWidget> on State<T> {
//   void waitForScreen(VoidCallback onComplete) {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       onComplete.call();
//     });
//   }
// }
class NoInternet extends StatefulWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'NO INTERNET',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      )),
    );
  }
}
