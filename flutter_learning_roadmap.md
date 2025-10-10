# 🚀 Flutter Learning Roadmap (Beginner → Mastery)

This roadmap is designed for 2h/day learning, focusing on **practice
first**.\
Apps are categorized into **Small**, **Medium**, and **Big** projects.\
Each app has: Goal, Widgets, Docs, and Tips.

------------------------------------------------------------------------

## 🟢 Small Apps (1 session = 2h each)

### 1. Counter App

-   **Goal**: Build a counter with + / -- buttons.
-   **Widgets**: `Scaffold`, `AppBar`, `Column`, `Row`,
    `ElevatedButton`, `setState`.
-   **Docs**:
    -   [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html)\
    -   [ElevatedButton](https://api.flutter.dev/flutter/material/ElevatedButton-class.html)\
-   **Tips**: Learn hot reload and state updates.

------------------------------------------------------------------------

### 2. Profile Card

-   **Goal**: Show a profile card with photo + info.
-   **Widgets**: `Card`, `ListTile`, `CircleAvatar`, `Column`, `Text`.
-   **Docs**:
    -   [Card](https://api.flutter.dev/flutter/material/Card-class.html)\
    -   [CircleAvatar](https://api.flutter.dev/flutter/material/CircleAvatar-class.html)\
-   **Tips**: Focus on styling.

------------------------------------------------------------------------

### 3. Dice Roller

-   **Goal**: Tap button → random dice image.
-   **Widgets**: `Image.asset`, `Random`, `Column`, `ElevatedButton`.
-   **Docs**:
    [Image.asset](https://api.flutter.dev/flutter/widgets/Image/Image.asset.html)
-   **Tips**: Practice using assets in `pubspec.yaml`.

------------------------------------------------------------------------

### 4. Gallery Grid

-   **Goal**: Display grid of images (assets or online).
-   **Widgets**: `GridView.builder`, `Image.network`, `Padding`.
-   **Docs**:
    [GridView](https://api.flutter.dev/flutter/widgets/GridView-class.html)
-   **Tips**: Learn list building.

------------------------------------------------------------------------

### 5. Stopwatch / Timer

-   **Goal**: Start/stop a timer with display.
-   **Widgets**: `Timer`, `Text`, `ElevatedButton`.
-   **Docs**:
    [Timer](https://api.flutter.dev/flutter/dart-async/Timer-class.html)
-   **Tips**: Practice async updates.

------------------------------------------------------------------------

### 6. Music Player UI

-   **Goal**: UI only (play/pause buttons, song title).
-   **Widgets**: `IconButton`, `Row`, `Text`, `AnimatedContainer`.
-   **Docs**:
    [IconButton](https://api.flutter.dev/flutter/material/IconButton-class.html)
-   **Tips**: Focus on layout.

------------------------------------------------------------------------

## 🟡 Medium Apps (2--3 sessions each)

### 7. To-Do List

-   **Goal**: Add/remove tasks, mark them done.
-   **Widgets**: `ListView.builder`, `CheckboxListTile`, `TextField`,
    `setState`.
-   **Docs**:
    [ListView.builder](https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html)
-   **Tips**: Manage state carefully.

------------------------------------------------------------------------

### 8. Calculator

-   **Goal**: Simple + -- × ÷ operations.
-   **Widgets**: `GridView`, `Text`, `ElevatedButton`.
-   **Docs**:
    [GridView](https://api.flutter.dev/flutter/widgets/GridView-class.html)
-   **Tips**: Practice button interaction.

------------------------------------------------------------------------

### 9. Quiz App

-   **Goal**: Multi-question quiz with score.
-   **Widgets**: `Navigator.push`, `Column`, `ElevatedButton`, `Text`.
-   **Docs**:
    [Navigator](https://api.flutter.dev/flutter/widgets/Navigator-class.html)
-   **Tips**: Learn navigation.

------------------------------------------------------------------------

### 10. Notes App (local)

-   **Goal**: Save notes locally using shared_preferences.
-   **Widgets**: `ListView`, `TextField`, `SharedPreferences` (package).
-   **Docs**:
    [shared_preferences](https://pub.dev/packages/shared_preferences)
-   **Tips**: Persistence basics.

------------------------------------------------------------------------

### 11. Expense Tracker

-   **Goal**: Add expenses, show daily total.
-   **Widgets**: `ListView`, `Card`, `Text`.
-   **Docs**:
    [Card](https://api.flutter.dev/flutter/material/Card-class.html)
-   **Tips**: Good for list management.

------------------------------------------------------------------------

### 12. Weather App

-   **Goal**: Input city → fetch weather API.
-   **Widgets**: `TextField`, `FutureBuilder`, `http` package.
-   **Docs**: [http](https://pub.dev/packages/http),
    [FutureBuilder](https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html)
-   **Tips**: Learn API + JSON parsing.

------------------------------------------------------------------------

## 🔴 Big Apps (3--5 sessions each)

### 13. Movie Browser (API + Search)

-   **Goal**: Fetch movie list, search by title.
-   **Widgets**: `ListView.builder`, `TextField`, `http`,
    `FutureBuilder`.
-   **Docs**:
    [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html)
-   **Tips**: API + filtering.

------------------------------------------------------------------------

### 14. News App (API with categories)

-   **Goal**: Show news by categories (sports, tech, etc.).
-   **Widgets**: `BottomNavigationBar`, `ListView`, `http`.
-   **Docs**:
    [BottomNavigationBar](https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html)
-   **Tips**: Multi-screen navigation.

------------------------------------------------------------------------

### 15. Auth Mock App

-   **Goal**: Login/signup screens with validation.
-   **Widgets**: `Form`, `TextFormField`, `Navigator`.
-   **Docs**:
    [Form](https://api.flutter.dev/flutter/widgets/Form-class.html)
-   **Tips**: Input validation.

------------------------------------------------------------------------

### 16. Chat UI

-   **Goal**: Bubble-style messages, scrollable list.
-   **Widgets**: `ListView.builder`, `Container`, `Text`, `Padding`.
-   **Docs**:
    [Container](https://api.flutter.dev/flutter/widgets/Container-class.html)
-   **Tips**: Custom UI styling.

------------------------------------------------------------------------

### 17. Task Manager with Dates

-   **Goal**: To-do app with due dates.
-   **Widgets**: `DatePicker`, `ListView`, `TextField`.
-   **Docs**:
    [showDatePicker](https://api.flutter.dev/flutter/material/showDatePicker.html)
-   **Tips**: Learn date/time handling.

------------------------------------------------------------------------

### 18. Recipe App

-   **Goal**: Show recipe list (API or JSON).
-   **Widgets**: `ListView`, `Card`, `http`.
-   **Docs**: [http](https://pub.dev/packages/http)
-   **Tips**: Combine list + API.

------------------------------------------------------------------------

### 19. E-commerce Mock App

-   **Goal**: Product list + cart screen.
-   **Widgets**: `ListView`, `Navigator`, `BottomNavigationBar`,
    `setState`.
-   **Docs**:
    [Navigator](https://api.flutter.dev/flutter/widgets/Navigator-class.html)
-   **Tips**: State sharing.

------------------------------------------------------------------------

### 20. Final Project (Choose your idea)

-   Examples: CV App, School Manager, Mini Social App.
-   Combine everything: UI, navigation, API, storage.

------------------------------------------------------------------------

# ✅ Learning Notes Template

Use this at the end of each session:

    Day X – [App Name]
    Goal: 
    Widgets learned: 
    Docs used: 
    Problem faced: 
    Solution: 
    Code snippet: 

------------------------------------------------------------------------

# 📌 Tips for Mastery

-   **GitHub everything** → 1 repo per app with README.\
-   **Take notes** → Use Markdown/Notion for cheatsheets.\
-   **Refactor after coding** → Split widgets, rename variables.\
-   **Repetition** → Reuse patterns (ListView, Forms, etc.).\
-   **Read Docs** → 2--3 min whenever you see a new widget.

------------------------------------------------------------------------

Happy coding 🚀
