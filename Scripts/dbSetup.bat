@echo off
REM Database credentials
set DB_USER=your_db_user
set DB_PASS=your_db_password
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