# Project example to connect BINANCE api to a Flutter project

A simple project to connect to the binance api and get the data of the coins.

# Pre-requisites 🚩
You need to have the following package in order to run the project

```
flutter    v3.19.6 stable channel
dart       v3.3.4
```

# Steps to run the project
1. Clone the project
2. Run the command `flutter pub get`
3. Run the command `flutter pub run build_runner build -d` to generate the user model User Managment
4. Run the command `flutter run` to run the project

# Api Considerations
The project use open test api from [Binance](https://binance-docs.github.io/apidocs/spot/en/#general-info) to get the data of the coins.
So is not required any api key to run the project.
Important: The api is a test api, so use it only for testing purposes.

# Design Considerations
The project use a simple design with a list of coins and a detail page of the coin selected.
I emulate the design of the binance app, with a DS colors but a material design for the components.

# Important
Project use database to store the user data, so is important to run the command `flutter pub run build_runner build -d` to generate the user model User Managment
You can login with a registered user or create a new one.
First time you need create a new user, after that you can login with the user created.

