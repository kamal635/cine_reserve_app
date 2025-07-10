
# Cine Reserve App 🎬

A modern, beautiful, and fully-featured cinema reservation app built with **Flutter**.  
This app allows users to browse movies, search, book tickets, select seats, and manage their reservations with a smooth and intuitive UI.

---

## 📱 Screenshots

| No Internet | Home | Movie Details | Select Date/Time |
|-------------|------|--------------|------------------|
| ![No Internet] ![WhatsApp Image 2025-07-10 at 6 46 54 PM](https://github.com/user-attachments/assets/344db3c0-b212-482e-8844-37ea80eb3112)
| ![Home] ![WhatsApp Image 2025-07-10 at 6 46 53 PM(3)](https://github.com/user-attachments/assets/6ede3043-9706-4d1d-8f31-f173f4bd53c5)
| ![Details] ![WhatsApp Image 2025-07-10 at 6 46 53 PM(2)](https://github.com/user-attachments/assets/cf64e08f-064e-45b1-8e1c-186e5b6f502d)
| ![Date/Time] ![WhatsApp Image 2025-07-10 at 6 46 53 PM(1)](https://github.com/user-attachments/assets/0b272434-d689-485d-96ed-e92d7fc481b7)
 |

| Select Seats | Select Seats (Selected) | Confirm | Mobile Ticket | Search |
|--------------|------------------------|---------|--------------|--------|
| ![Seats]![WhatsApp Image 2025-07-10 at 6 46 53 PM](https://github.com/user-attachments/assets/3fbecec0-e17b-45c8-a91c-3648d09c09e5)
  | ![Seats Selected] ![WhatsApp Image 2025-07-10 at 6 46 52 PM(3)](https://github.com/user-attachments/assets/51aa8b97-fe81-435a-a590-dc644449d217)
 | ![Confirm] ![WhatsApp Image 2025-07-10 at 6 46 52 PM(2)](https://github.com/user-attachments/assets/8410d594-b3c4-40d9-8c7d-3953f10dd932)
| ![Ticket] ![WhatsApp Image 2025-07-10 at 6 46 52 PM(1)](https://github.com/user-attachments/assets/db80ded7-7533-49ce-b9a1-93117ecf0084)
 | ![Search] ![WhatsApp Image 2025-07-10 at 6 46 52 PM](https://github.com/user-attachments/assets/0788e53f-3187-42d3-87f5-8c01e1dfe3eb)
 |

---

## ✨ Features

- **Modern UI:** Gradient backgrounds, custom blurred effects, and smooth navigation.
- **Movie Browsing:** View "Now in Cinemas", "Top Rated", and "Upcoming" movies.
- **Movie Details:** See detailed info, genres, and overviews for each movie.
- **Search:** Fast, responsive search for movies (supports English & Arabic).
- **Reservation Flow:**  
  - Select movie, date, and time.
  - Choose seats visually (with color-coded status: available, reserved, selected).
  - Confirm and book tickets.
- **Mobile Tickets:** View and manage your booked tickets with barcode.
- **Offline Handling:** Custom "No Internet" screen with clear feedback.
- **State Management:** Uses Bloc pattern for robust, scalable state handling.
- **Local Caching:** Hive for offline data persistence and fast access.
- **Responsive Design:** Adapts to all screen sizes using `flutter_screenutil`.

---

## 🛠️ Tech Stack

- **Flutter** (Dart)
- **Bloc** for state management
- **Hive** for local storage
- **Dio** for networking
- **GetIt** for dependency injection
- **Custom Widgets** for UI/UX polish
- **The Movie Database (TMDB) API** for movie data

---

## 📂 Project Structure

```
lib/
  core/
    constant/         # App colors, gradients, strings, assets
    functions/        # App initialization, system chrome, router
    utils/            # API service, DI, Bloc observer, etc.
    widgets/          # Shared widgets (buttons, appbars, etc.)
  features/
    home/
      data/           # Data sources (remote/local), models, repositories
      domain/         # Entities, repositories, use cases
      presentation/   # Blocs, views, widgets
    reservation/
      data/
      domain/
      presentation/
    tickets/
      data/
      domain/
      presentation/
  main.dart           # App entry point
```

---

## 🚀 Getting Started

### 1. **Clone the repository**
```sh
git clone https://github.com/yourusername/cine_reserve_app.git
cd cine_reserve_app
```

### 2. **Install dependencies**
```sh
flutter pub get
```

### 3. **Setup Hive**
No manual setup needed, boxes are opened automatically at app start.

### 4. **Run the app**
```sh
flutter run
```

### 5. **API Key**
- The app uses TMDB API. Make sure you have a valid API token in `lib/core/constant/strings.dart` (`kToken`).

---

## 🧑‍💻 Development Approach

- **Separation of Concerns:**  
  - Data, domain, and presentation layers are strictly separated (Clean Architecture).
- **Bloc Pattern:**  
  - All business logic and state transitions are handled via Bloc for maintainability and testability.
- **Dependency Injection:**  
  - All dependencies are registered and managed via GetIt for easy scalability.
- **Constants & Theming:**  
  - All colors, gradients, and strings are centralized for easy customization.
- **Error Handling:**  
  - Custom error states and offline screens for robust UX.
- **Image Handling:**  
  - All movie images are loaded from TMDB using the correct base URL, with fallbacks for missing images.
- **Responsive UI:**  
  - Uses `flutter_screenutil` for pixel-perfect layouts on all devices.

---

## 📝 Notes

- All Bloc event/state definitions are in separate files for clarity.
- All text strings are extracted as constants for easy localization.
- The app is fully commented in English for maintainability.
- The project is ready for further extension (e.g., user authentication, payment integration).

---

## 📧 Contact

For any questions, suggestions, or contributions, feel free to open an issue or contact me at kamalibrahim397@gmail.com.

---

**Enjoy your movie time! 🍿**

---

