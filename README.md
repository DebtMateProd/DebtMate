# DebtMate

DebtMate is a mobile application built with **Flutter** and a backend API written in **.NET Core**.  
It allows users to manage and settle shared expenses, including receipt scanning and expense allocation.
For now it is prepared only in Polish language.

---

## Project Structure
- `/myapp` – Flutter mobile application  
- `/DebtMateAPI` – .NET Core backend API  

---

## Screenshots

### Home Screen
<img width="324" height="727" alt="home" src="https://github.com/user-attachments/assets/cce06e1d-9d0c-4308-b832-5155d413bbf8" />


### Receipt Settlement Screen
<img width="324" height="727" alt="receipt" src="https://github.com/user-attachments/assets/b3072275-d934-48ec-b62c-02c076a64b64" />

---

## Requirements
- Flutter SDK (3.0 or higher)  
- .NET 8 SDK  
- Android Studio / VS Code with Flutter plugin  
- Emulator or physical Android/iOS device  
- MySQL server  

---

## Running the Application

### 1. Clone the repository
```bash
git clone
```

### 2. Configure the database
Create new MySQL database  
Update connection string in appsettings.json  
Apply database migrations:  
```bash
dotnet ef database update
```

### 3. Run the backend
```bash
dotnet restore
dotnet run
```

## Configuration
Make sure the Flutter app points to the correct API base URL.
Ensure your MySQL server is running and accessible with the credentials provided in appsettings.json

## License
This project is provided as-is for educational and development purposes.
