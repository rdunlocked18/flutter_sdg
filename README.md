## 📱 flutter_sdg_dropdown

Flutter App to showcase dropdowns with API. Uses Production grade app coding architecture Supports Localizations, Quick Env Setup & Themes. There are currently 3 Pages in app Home, Profile and Settings. 

#### Features in App: 

- Home Page : Dropdown Selections, First Select State then select country
- Profile Page : The selection on Home Screen Dropdowns will reflect on this Screen.
- Settings Screen : 
    - Change Theme from Light to Dark (App Wide)
    - Switch App Wide Locale between English & Spanish (Only some of the Texts are Showcased for Localizations).



## 📁 Folder Structure

Application Currently is using a Hybrid of CLEAN architecture and Good Code Practice.

`lib`: Application Specific base folder
- `core`: All common application-specific configurations
    - `network`: network client configurations & Interceptor required .env file with variable API_KEY
    - `common`: global widgets
    - `resources`: application utility classes like colors, constants

- `environments`
    - `runner` : base run app function calling First page widget & can consists of deeper configurations if needed.
    - `app` : Base main widget 
    - `main` : main common to initialize environment (Currently only prod hence no Env configs defined.)

- `features` : Feature-wise development
    - `home`
        - `data`
            - `datasources`: RemoteDatasource used to call APIs to get all countries and all States
            - `models`: Place model basic common blueprint to fetch data
            - `repositories`: The Middleware repository's implementation for calling remote data source methods.
        - `presentation`
            - `state`: Home state model class used as state that home_page_view uses and updates UI when the stat class is updated.
            - `view`: HomePage UI implementation with Consumer widget to listen to stat update
            - `view_model`: Home_View_model to mutate the state with Business logics and calling the repositories.
        -  `provider` : global definitions of providers for that specific feature.

    - `l10n`
        - ARB files for English & Spanish Translations.




## ⚠️ How to Run

`cd project_dir`

 create .env in `lib/core/network`

`flutter pub get`

`flutter gen-l10n` to generate English & Spanish localizations

`flutter run`

`flutter build apk --release -t lib/environment/main.dart`

## 📸 Screen Recording Demo


https://github.com/user-attachments/assets/4091f8bb-395f-4f38-93b5-e81ef43a8997





