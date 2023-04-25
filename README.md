 # Smsrly
 
### Project Features

- Written in [Dart](https://dart.dev/)
- Implementing MVVM architecture pattern.
- Following clean architecture principles.
- State Management with [Provider](https://pub.dev/packages/provider)
- Safe API call with [Http](https://pub.dev/packages/http)

### Architecture 
This app uses [***MVVM (Model View View-Model)***](https://developer.android.com/jetpack/docs/guide#recommended-app-arch) architecture.
<br>
<br>
![clean arch](https://user-images.githubusercontent.com/54749693/201477289-bc3cadc5-1db2-448c-9079-3899747fcc7c.jpg)

<br>
<br>

## 🛠 Project Structure

The project separated into three main layers:
- Data
- Presentation
- Domain

### 🔸 Data
Data layer contains application data that are fetched from either the API or local.

Consists of three packages:
- `local`
- `remote` contains **API Calls**
- `repository` contains **implementations** of repository interfaces that are defined in the domain layer

### 🔸 Presentation
Presentation layer is responsible for displaying application data on the screen. It contains UI elements that render the data on the screen and ViewModel classes that store and manage data.

Consists of two packages:
- `viewmodel`
- `ui` contains the **Widgets** that we had used in the application

### 🔸 Domain
Domain layer is the central layer of the project. This layer is a bridge between the data layer and the presentation layer.

Consists of three packages:
- `model` contains data classes that hold the data retrieved from the data layer to be used later on in the presentation layer to expose it to UI
- `repository` contains repository **interfaces** to abstract the domain layer from the data layer
- `usecase` contains use cases(interactors) that handle the business logic, which are reused by multiple ViewModels


## 📚 Libraries

## Prerequisites 📝
-  Android Studio(IDE) ,IntelliJ IDEA or VS code to run this project


