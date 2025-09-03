# eSociety

**eSociety** is an iOS application built using SwiftUI and SwiftData for managing society residents, flats, payments, activities, and reports. The app follows MVVM architecture with a coordinator pattern for navigation and modularized reusable components.

---

## Table of Contents
- [Features](#features)
- [Architecture](#architecture)
- [Folder Structure](#folder-structure)
- [Modules](#modules)
- [Models](#models)
- [Views](#views)
- [ViewModifiers](#viewmodifiers)
- [Utilities](#utilities)
- [Networking](#networking)
- [Data Persistence](#data-persistence)
- [Screenshots](#screenshots)
- [How to Run](#how-to-run)
- [Future Improvements](#future-improvements)
- [Author](#author)

---

## Features
- User Login with email/password validation.
- Terms & Conditions acceptance before accessing the app.
- Dashboard showing:
  - Total Families and Defaulters with badges.
  - Planned vs Actual Activities Graph.
  - Year-over-Year Spending Graph.
- Family management:
  - Add/Edit Resident information.
  - Search and filter families.
- Toast messages, alerts, and loading indicators.
- Reusable components and consistent styling.

---

## Architecture
- **MVVM Pattern**: ViewModels manage business logic and state.
- **Coordinator Pattern**: Handles navigation flow (LoginCoordinator).
- **SwiftUI Views**: Declarative UI with reusable components.
- **SwiftData**: Persistent storage for `Resident` model (SQLite backend).
- **Async/Await Networking**: WebServiceManager handles API calls.

---

## Folder Structure  

<img width="268" height="621" alt="Screenshot 2025-09-03 at 11 46 47 PM" src="https://github.com/user-attachments/assets/50f17e80-b3e8-4cef-a202-53905804822c" />

---

## Modules

### Models
- `Resident`: SwiftData model for society residents.
- `FlatInfo`: Lightweight struct for flat information.
- `LoginRequest` / `LoginResponse`: Codable models for API interaction.

### Views
- `LoginView`: Login form with validation, toast, and alerts.
- `DashboardView`: Overview of families, activities, and spending.
- `MainView`: Navigation hub with big dashboard buttons.
- `FamilyListView`: List and manage residents with search functionality.
- `AddNewFamilyView`: Form for adding or editing resident details.
- Graph Views: `PlannedActivitiesGraphView`, `YoYSpendingView`.

### ViewModifiers
- `PrimaryButtonModifier`: Standardized button style.
- `InputFieldModifier`: Standard text field style.

### ViewModels
- `LoginViewModel`: Manages login state and API calls.

### Coordinator
- `LoginCoordinator`: Manages navigation and terms acceptance flow.

### Utilities
- `Validator`: Regex-based email and password validation.
- `Logger`: Debug logging helper.
- Font and color constants.
- Localized keys for UI strings.

### Components
- `BaseView`: Loader, toast, and alert wrapper.
- `BadgeView`: Circular badge for notifications/counts.

---

## Data Persistence
- **SwiftData**:
  - `@Model` Resident class stored in SQLite.
  - Supports insert, update, delete operations.
  - Uses `@Query` and `ModelContext` for reactive UI updates.

---

## Screenshots
> Add screenshots here for better clarity during review.

**Login Screen**  
<img width="296" height="639" alt="Simulator Screenshot - iPhone 16 Plus - 2025-09-03 at 23 48 09" src="https://github.com/user-attachments/assets/2ba91b91-accc-45f9-826b-084c2d0cc8d9" />


**Dashboard Screen**  
<img width="296" height="639" alt="Simulator Screenshot - iPhone 16 Plus - 2025-09-03 at 23 50 47" src="https://github.com/user-attachments/assets/fb8b9997-4290-4ab4-af03-0ebb04fb933f" />


**Family List**  
<img width="296" height="639" alt="Simulator Screenshot - iPhone 16 Plus - 2025-09-03 at 23 51 10" src="https://github.com/user-attachments/assets/bf41a66c-b783-4684-a136-98fd8bdbe9ac" />


**Add/Edit Family Form**  

<img width="296" height="639" alt="Simulator Screenshot - iPhone 16 Plus - 2025-09-03 at 23 51 28" src="https://github.com/user-attachments/assets/9599ed31-addf-4caf-8422-a4540b4d79c6" />

**Graph Views**  

<img width="296" height="639" alt="Simulator Screenshot - iPhone 16 Plus - 2025-09-03 at 23 51 56" src="https://github.com/user-attachments/assets/7cc49403-5c98-42d2-99ea-d4d7431ffd9f" />

---

## How to Run
1. Clone the repository.
2. Open `eSociety.xcodeproj` in Xcode 15+.
3. Ensure your simulator/device supports iOS 17+.
4. Run the app.
5. Accept Terms & Conditions on first launch to access the dashboard.

---

## Future Improvements
- Use **Swift Charts** for graphs instead of manual GeometryReader calculations.
- Add **dark mode support**.
- Introduce **Dependency Injection** for ViewModels.
- Implement **unit tests** for ViewModels and network calls.
- Enhance **accessibility** with VoiceOver and dynamic font support.
- Add **error mapping** and retry logic for network calls.

---

## Author
- **Mahaboobsab Nadaf** – Initial development, SwiftUI & SwiftData integration.

