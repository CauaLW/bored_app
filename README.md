**Project Name: Bored App**

## Description

The Bored App is a Flutter application designed to provide users with creative
ideas and suggestions to overcome boredom. The app utilizes the BoredAPI to
fetch various activities and tasks that users can engage in whenever they find
themselves feeling unoccupied or idle. By suggesting a diverse range of
activities, the app aims to keep users entertained and engaged in fun and
meaningful ways.

- For now, the app is tested on Android and web, theoretically it can run on
  IOS, but because I don't have a MacBook to test, I can't guarantee. Feel free
  to test if you have one

## Features

- Fetches random activity ideas from the BoredAPI.
- Displays activity details, including type, participants, price, and more.
- Provides an intuitive and user-friendly interface.
- Incorporates the Flutter Bloc architecture for state management.

## Dependencies

- http: ^1.1.0
- dartz: ^0.10.1
- equatable: ^2.0.5
- flutter_bloc: ^8.1.3
- get_it: ^7.6.0

## Dev Dependencies

- mockito: ^5.4.2
- build_runner: ^2.4.6

## Installation

1. Clone this repository: `git clone https://github.com/caualw/bored_app.git`
2. Navigate to the project directory: `cd boredom_buster_app`
3. Install dependencies: `flutter pub get`

## Usage

1. Run the app on an emulator or physical device: `flutter run`
2. Once the app is launched, it will start on the main page
3. Tap the "Get Idea" button to get another activity suggestion
4. The ideia will be showed in the card

## Architecture

The Bored App follows the Flutter Bloc architecture for effective state
management. The separation of UI, business logic, and data layers ensures a
clean and maintainable codebase.

## Credits

- BoredAPI: [https://www.boredapi.com/](https://www.boredapi.com/)
- Flutter: [https://flutter.dev/](https://flutter.dev/)
