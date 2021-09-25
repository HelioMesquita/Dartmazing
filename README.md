# Dartmazing

A Flutter project with layout based on App Store that can check the most starred and last updated Dart repository. 

In additional to understand the advantages and disadvantages of using native resources, a flutter network layer called Dartmazing_network was developed that uses native dependencies like Alamofire and OkHttp.

## Features

* Modularization
* BLoC - Cubit
* Pull-to-Refresh
* Infinity Scroll
* Dark Mode
* Internationalization (English and pt_BR)
* Unit tests
<!-- * Snapshots Tests
* Functional Tests
* Travis CI integration
* Codecov integration -->

### Prerequisites

* [Flutter](https://developer.apple.com/xcode/) 2.2.3
* [Cocoapods](https://cocoapods.org) 1.10.2
* [Xcode](https://developer.apple.com/xcode/) 12.2

### Getting Started

First of all download and install [Flutter](https://flutter.dev/docs/get-started/install) and configure it, then clone the repository

```
https://github.com/HelioMesquita/Dartmazing.git
```

Go to cloned directory and run this `main` file

```
~/dartmazing/dartmazing/main.dart
```

## Running the tests

## Built With

* [flutter_bloc](https://pub.dev/packages/flutter_bloc) - Flutter Widgets that make it easy to implement the BLoC
* [equatable](https://pub.dev/packages/equatable) - Simplify Equality Comparisons
* [provider](https://pub.dev/packages/provider) - A wrapper around InheritedWidget to make them easier to use and more reusable. Used mainly to dependecy injection.
* [carousel_slider](https://pub.dev/packages/carousel_slider) - A carousel slider widget.
* [dartmazing_network](https://github.com/HelioMesquita/Dartmazing/tree/main/dartmazing_network) - A local plugin that performs requests using native.

