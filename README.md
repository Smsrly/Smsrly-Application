 # Smsrly 🏡
 
- `Smsrly` is a real estate system that acts as an intermediary
between those who want to buy a property and those who want to sell it.
- The goal of `Smsrly` is to protect people who wants to sell their real estate from
deception and making an honest broker between buyers and sellers in the Middle East.

 <br>

 ## ✨ Features
 
### 🔸 Project Features

- Written in [Dart](https://dart.dev/)
- Implementing MVVM architecture pattern.
- Following clean architecture principles.
- State Management with [Provider](https://pub.dev/packages/provider)
- Safe API call with [Http](https://pub.dev/packages/http)
- Responsive [*](https://pub.dev/packages/flutter_screenutil)

<br>

### 🔹 App Features

- Authentication
- Third-party Authentication: utilizes login with **Google** as a third-party authentication method.
- Authorization
- Auto Login
- Reset Password
- Email Verification
- Getting user location
- Browse Real-Estates in Home Screen
- Arrange The Real-Estates from the closest to the user to the furthest
- Search and filter Real-Estates in explore screen
- Viewing The Real-Estate details in show detail screen
- Viewing Real-Estate location on the map
- Ability to request and save the Real-Estates
- For the owner, he can delete his Real-Estate and view the requests of it
- The user can upload Real-Estate and add at least 5 pictures of it
- can explore the pictures of the Real-Estate easily `carousel_slider` package
- can view his uploads in uploads screen 
- can view his requests in requests screen and can delete the request
- can view his saves in saved screen
- can logout from the application
- can update (name, number, location), delete his account
- can send an email to us


<br>
<br>

## 🛠 Project Architecture

This app uses [***MVVM (Model View View-Model)***](https://developer.android.com/jetpack/docs/guide#recommended-app-arch) architecture.
<br>
<br>
![MVVM](https://user-images.githubusercontent.com/90563044/234581516-1e5fab58-02b6-4ada-acb3-90e1ef99c28d.jpg)

<br>
<br>


The project separated into three main layers:
- Data
- Presentation
- Domain
<br>

### 🔸 Data
Data layer contains application data that are fetched from either the API or local.

Consists of three packages:
- `local`
- `api` contains **API Calls**
- `repository` contains **implementations** of repository interfaces that are defined in the domain layer
<br>

### 🔸 Presentation
Presentation layer is responsible for displaying application data on the screen. It contains UI elements that render the data on the screen and ViewModel classes that store and manage data.

Consists of two packages:
- `viewmodel`
- `ui` contains the **Widgets** that we had used in the application
<br>

### 🔸 Domain
Domain layer is the central layer of the project. This layer is a bridge between the data layer and the presentation layer.

Consists of three packages:
- `model` contains data classes that hold the data retrieved from the data layer to be used later on in the presentation layer to expose it to UI
- `repository` contains repository **interfaces** to abstract the domain layer from the data layer
- `usecase` contains use cases(interactors) that handle the business logic, which are reused by multiple ViewModels

<br>

## 📚 Packages

<br>

- [Provider](https://pub.dev/packages/provider)
- [Http](https://pub.dev/packages/http)
- [ScreenUtil](https://pub.dev/packages/flutter_screenutil)   `To make the app responsive`
- [SharedPrefrences](https://pub.dev/packages/shared_preferences)
- [GoogleSignIn](https://pub.dev/packages/google_sign_in)
- [GoogleMaps](https://pub.dev/packages/google_maps_flutter)
- [ImagePicker](https://pub.dev/packages/image_picker)
- [GeoLocator](https://pub.dev/packages/geolocator)
- [CarouselSlider](https://pub.dev/packages/carousel_slider)


<br>

## Prerequisites 📝
- Android Studio(IDE) ,IntelliJ IDEA or VS code to run this project
- Make Sure that `Smsrly-BackEnd` is running at the same time


<details>
<summary><h3>Notes</h3></summary>
 
- If you are using a `real device` as emualtor you need to add your ip to the baseUrl variable in `ApiConstants`.
 
- If you are using an `Emualtor` you need to add `10.0.2.2` to the baseUrl variable in `ApiConstants`.

 
</details>
