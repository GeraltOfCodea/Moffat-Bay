@echo off
REM Database credentials
set DB_USER=root
set DB_PASS=password1
set DB_HOST=localhost

REM Initialize database
echo Initializing database...
mysql -u %DB_USER% -p%DB_PASS% -h %DB_HOST% < mbdatabase_create.sql
if %errorlevel% neq 0 (
    echo Error initializing database.
    exit /b %errorlevel%
)

REM Insert test data
echo Inserting test data...
mysql -u %DB_USER% -p%DB_PASS% -h %DB_HOST% < insertRoomData.sql
if %errorlevel% neq 0 (
    echo Error inserting test data.
    exit /b %errorlevel%
)

echo Database setup and test data insertion complete!
pause