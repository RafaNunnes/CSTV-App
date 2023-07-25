# CSTV

CSTV is an iOS app that allows users to keep track of CS:GO matches happening across various worldwide tournaments.

## Features

- The app displays CS:GO matches starting from the current date and provides a comprehensive "match detail" screen that showcases team names, roster, and match time.

## Screens

CSTV consists of the following screens:

1. **Splash Screen**: The initial screen that welcomes users to the app.
2. **Main Screen**: The matches list screen, where users can view CS:GO matches from different tournaments.
3. **Match Details Screen**: A detailed view of a selected match, showcasing team information and match timing.

## Data Source

CSTV uses the [PandaScore API](https://pandascore.co/) to list CS:GO matches and fetch match details, providing users with up-to-date information about ongoing tournaments.

## Development Key Points

1. **Tools and Architectures:**
   1. The application was developed using SwiftUI, due to its versatility and ease in creating efficient interfaces, allowing the project to be completed quickly.
   2. The MVVM architecture was used for the project's development, as it is widely used in the iOS community and works very well with SwiftUI.
   3. Use of external library [Kingfisher](https://github.com/onevcat/Kingfisher) through Swift Package Manager (SPM) to fetch images via URL and mainly to manage cached images.

2. **Development:**
   1. Whenever possible, code reusability was prioritized, both in building interfaces and in the back-end code, to optimize future maintenance and even facilitate the insertion of new features.
      1. All visual interfaces were built using a component-based strategy, allowing the extraction and reuse of repeated components, such as team images, which appear both on the match list screen and on the match detail screen.
      2. The classes responsible for API requests to PandaScore were specially designed to be generic to handle different types of GET requests for matches, teams, and players, accommodating different types of decoders.
      3. Colors and fonts were structured to maintain interface design scalability.

   2. Enumerations, static variables, and extensions were used to maintain consistency and scalability of the App.
   3. Despite the similarity of information and the proposed use of MVVM, a ViewModel was used for each of the main screens for the sake of responsibility delegation and code readability.
   4. Some of latest iOS resources (above iOS 15.0) were used, such as Refreshable for Pull-to-refresh, and NavigationPath for navigation between screens, which facilitated code readability and focus on the most relevant parts of the project.

## Installation

To run CSTV on your iOS device, follow these steps:

1. Clone the repository
2. Open the project in Xcode
3. Build and run the app on your connected iOS device or simulator.

## Requirements

- iOS 16.0+
- Xcode 14.0+

## License

CSTV is distributed under the [MIT License](https://opensource.org/licenses/MIT).
