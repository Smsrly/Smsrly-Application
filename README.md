# Smsrly 🏡

![project_poster6](https://github.com/Smsrly/Smsrly/assets/90563044/9f01297e-a2fb-46b2-b130-8b15bbe8042f)

Smsrly is a real estate platform that serves as an intermediary between property buyers and sellers, with a primary focus on ensuring transparency and honesty in the Middle East real estate market.

## ✨ Features

### 🔸 Project Features

- **Programming Language:** Written in [Dart](https://dart.dev/).
- **Architecture:** Implements the MVVM (Model-View-ViewModel) architecture pattern.
- **Clean Architecture:** Follows clean architecture principles for code organization.
- **State Management:** Utilizes [Provider](https://pub.dev/packages/provider) for efficient state management.
- **API Handling:** Ensures safe API calls using [Http](https://pub.dev/packages/http).
- **Responsive Design:** Implements responsiveness using [flutter_screenutil](https://pub.dev/packages/flutter_screenutil).

### 🔹 App Features

- **Authentication:** Supports user authentication.
- **Third-party Authentication:** Allows users to log in using their Google accounts.
- **Authorization:** Manages user permissions and access.
- **Auto Login:** Provides an automatic login feature for returning users.
- **Password Reset:** Allows users to reset their passwords.
- **Email Verification:** Supports email verification for added security.
- **Location Services:** Retrieves user location for location-based features.
- **Property Listing:** Enables users to browse real estate listings on the home screen.
- **Location-Based Sorting:** Sorts property listings based on proximity to the user's location.
- **Search and Filter:** Provides search and filtering options for property listings on the explore screen.
- **Property Details:** Allows users to view detailed information about a property.
- **Map Integration:** Displays property locations on a map.
- **Request and Save:** Users can request more information about a property or save it for later.
- **Property Management:** Property owners can delete their listings and view request history.
- **Listing Upload:** Property owners can upload property listings with at least 5 images.
- **Image Carousel:** Utilizes the `carousel_slider` package for easy image exploration.
- **User Profile:** Allows users to view their uploads, requests, and saved listings.
- **Account Management:** Users can update their personal information, delete their accounts, and contact support via email.
- **Logout:** Provides a logout option.

## 🛠 Project Architecture

Smsrly employs the MVVM (Model-View-ViewModel) architecture, which separates the application into three main layers:

### 🔸 Data

The data layer contains application data fetched from the API or stored locally. It includes three packages:

- `local`
- `network` (API calls)
- `repository` (implementations of repository interfaces defined in the domain layer)

### 🔸 Presentation

The presentation layer is responsible for displaying data on the screen, including UI elements and ViewModel classes for data management. It consists of two packages:

- `viewmodel`
- `ui` (UI widgets used in the application)

### 🔸 Domain

The domain layer serves as the bridge between the data and presentation layers. It includes three packages:

- `model` (data classes for holding data from the data layer)
- `repository` (repository interfaces abstracting the domain from the data layer)
- `usecase` (use cases or interactors for handling business logic used by multiple ViewModels)

## 📚 Packages

Smsrly utilizes various Dart packages to enhance its functionality:

- [Provider](https://pub.dev/packages/provider)
- [Http](https://pub.dev/packages/http)
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) (for responsiveness)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [google_sign_in](https://pub.dev/packages/google_sign_in)
- [google_maps_flutter](https://pub.dev/packages/google_maps_flutter)
- [image_picker](https://pub.dev/packages/image_picker)
- [geolocator](https://pub.dev/packages/geolocator)
- [carousel_slider](https://pub.dev/packages/carousel_slider)

## 📝 Prerequisites

To run this project, you'll need the following:

- An IDE like Android Studio, IntelliJ IDEA, or VS Code.
- Ensure that `Smsrly-BackEnd` is running simultaneously.

**Notes:**

- If you're using a real device as an emulator, add your IP to the `baseUrl` variable in `ApiConstants`.
- If you're using an emulator, add `10.0.2.2` to the `baseUrl` variable in `ApiConstants`.
