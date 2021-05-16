# senior_project_prohealth

## As of 5/16/21, if you want to run these files, you must:

- Download and install flutter. Make sure your PATH variable is set properly.
- Download and install Android Studio. (Optional: Also install Visual Studio Code.)
- Install the Dart and Flutter plugins in Android Studio. (Optional: Do the same with VS Code.)
- Run the command flutter doctor. Fulfill all requirements.
- Install an Android emulator using Android Studio.
- Install XAMPP (or some equivalent) with Apache and MySQL for demo purposes.
- Import the database backup from the "database backup" folder using phpMyAdmin.
- Move the contents of the "php-API" folder to the "htdocs" folder in your XAMPP (or equivalent) directory.
- Start running Apache and MySQL.
- In the senior_project_prohealth\lib\Auth\auth.dart file, do the following:
  - On line 26, change the URL to "http://your_pc_name/path_to_api_from_htdocs/insertuser.php". (example: "http://DESKTOP-1234/PHP-API/insertuser.php")
  - On line 58, change the URL to "http://your_pc_name/path_to_api_from_htdocs/login.php". (example: "http://DESKTOP-1234/PHP-API/login.php")
  - Save changes.
- Open your Android emulator on the top left of Android Studio, then do Run->run 'main.dart'
  - (In VS Code, do Run->Start Debugging, then select your emulator to start up.)
- Sign up using the app, which should create an entry in the users table in the database if everything is configured correctly.
- Log in using the user info you just created.
- Check out what we have for the app so far!

Understand that we will have a more permanent solution to hosting the database and API. Once that solution is fully implemented, you must change the URLs from senior_project_prohealth\lib\Auth\auth.dart (lines 26 and 58 as of 5/16/21).

Also, understand that the app will be going through many changes, so make sure you keep update to the latest release (once we start officially releasing the app). You can do that from: https://github.com/jamep007/ProHealth/releases. The github repository is private for now, but will be made public when we create an official release.
