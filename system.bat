@ECHO OFF

cd /d D:\@systemR\local\aneka


start "Laravel 8030" cmd /k php artisan serve --host=127.0.0.1 --port=8030
start "Laravel 8031" cmd /k php artisan serve --host=127.0.0.1 --port=8031

echo Waiting for servers...

:wait_8030
timeout /t 2 >nul
curl -s http://127.0.0.1:8030 >nul
if errorlevel 1 goto wait_8030

echo Server 8030 ready!

:wait_8031
timeout /t 2 >nul
curl -s http://127.0.0.1:8031 >nul
if errorlevel 1 goto wait_8031

echo Server 8031 ready!

echo All servers ready!

start "" "C:\Program Files\Mozilla Firefox\firefox.exe" http://127.0.0.1:8030/admin/administration

exit