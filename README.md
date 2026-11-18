# 🛡️ Dominance Posts App

## 📌 Overview
This is a robust, offline-first Flutter application developed as part of **Section 5 Assignment**. It demonstrates the power of separating the UI layer from the data layer and utilizing local NoSQL databases to create an unbreakable user experience.

The app fetches posts from a simulated API, caches them locally using **Hive**, and allows users to seamlessly save their favorite posts. Even when the internet is entirely cut off, the system survives and serves the cached data flawlessly.

## ✨ Core Features
- **Offline Survival (Airplane Mode):** Gracefully falls back to local data when network requests fail, ensuring zero downtime.
- **Hive Integration:** Utilizes a lightweight, blazing-fast local NoSQL database to store complex Dart objects (`HiveObject`).
- **Favorites System:** A dedicated, isolated Hive box (`favoritesBox`) to manage user preferences persistently across app restarts.
- **Reactive UI:** Built with `ValueListenableBuilder` to reactively update the UI the moment the underlying Hive box changes, without unnecessary rebuilds.
- **Custom Injected Data:** Replaces standard dummy data with custom, meaningful records tailored to the academic environment.
## 📸 Proof of Concept (Screenshots)

Here is the visual proof of the system's capabilities:

### 1. The Main Dashboard (Posts Screen)
The initial state displaying all available posts without any selections.
![Initial State](screenshots%20(-------/1.png)

### 2. Active Selection
The main screen after taking control and selecting specific posts. Favorited items are highlighted with a solid star.
![Selected Posts](screenshots%20(-------/2.png)

### 3. The Inner Circle (Favorites Screen)
A dedicated space displaying only the posts the user has chosen to keep.
![Favorites Screen](screenshots%20(-------/3.png)

### 4. Absolute Dominance (Offline Mode)
The system running independently in Airplane Mode, successfully bypassing connection errors and relying solely on the Hive cache.
![Offline Mode](screenshots%20(-------/4%20(offline_mode).png)

## 🛠️ Tech Stack
- **Framework:** Flutter / Dart
- **Networking:** `http` package
- **Local Storage:** `hive` & `hive_flutter`
- **Generators:** `build_runner` & `hive_generator`

---
*Built to endure. Submitted for Section 5 Evaluation.*