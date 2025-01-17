// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import '../directives/router_outlet_directive.dart';
import 'navigation_params.dart';
import 'router_state.dart';

/// Result of the Navigation when calling Router.navigate.
enum NavigationResult { SUCCESS, BLOCKED_BY_GUARD, INVALID_ROUTE }

/// The Angular router, which is represented as a stream of state changes.
///
/// In order to be notified when navigation is occurring listen to the stream:
/// ```
/// class MyComponent implements OnInit {
///   final Router _router;
///
///   MyComponent(this._router);
///
///   @override
///   void ngOnInit() {
///     _router.stream.listen((newState) {
///       print('Navigating from ${_router.current} to $newState');
///     });
///   }
/// }
/// ```
abstract class Router {
  /// Current state of the router.
  ///
  /// During a stream navigation (via [listen]), this represents the previous
  /// state and is updated _after_ all subscribers are notified.
  RouterState get current;
  Stream<RouterState> get stream;

  Future<NavigationResult> navigate(
    String path, [
    NavigationParams navigationParams,
    bool forceNavigation = false,
  ]);

  /// Registers the root [routerOutlet] and navigates to the current route.
  ///
  /// The root outlet is where the router begins to resolve routes upon
  /// navigation. Does nothing if the root outlet is already set.
  void registerRootOutlet(RouterOutlet routerOutlet);

  /// Unregisters the root [routerOutlet].
  ///
  /// Does nothing if [routerOutlet] isn't the current root outlet.
  void unregisterRootOutlet(RouterOutlet routerOutlet);
}
