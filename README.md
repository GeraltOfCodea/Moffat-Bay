# Moffat-Bay
Moffat Bay Lodge Website for the Bellevue University Software Development Capstone, CSD460. 

# Contributors

- Sue Sampson
- Eric Williams-Phillips
- Celine Del Mundo
- Ryan Norrbom

# Database Initialization and Data Setup

This guide will help you initialize the MB_DATABASE on your local MySQL server and insert sample test data.

## Prerequisites

	•	MySQL installed and running.
	•	Credentials (username and password) for a MySQL user with permissions to create and modify databases.

## Windows Instructions

	1.	Download or Clone the Project
	•	Ensure that you have the following files in the scripts folder:
	•	mbdatabase_create.sql
	•	insertRoomData.sql
	•	dbSetup.bat
	2.	Configure Database Credentials
	•	Open dbSetup.bat in your IDE.
	•	Update the following variables with your MySQL credentials:

set DB_USER=your_db_user
set DB_PASS=your_db_password
set DB_HOST=localhost


	3.	Run the Batch Script
	•	Open Command Prompt.
	•	Navigate to the scripts directory in the project:

cd path\to\your\project\scripts


	•	Run the dbSetup.bat file to initialize the database and insert test data:

dbSetup.bat


	•	The script will create the database, tables, and insert room data. If any errors occur, the script will display an error message.

	4.	Verify Setup
	•	Open your MySQL client and confirm that the MB_DATABASE has been created.
	•	Check that tables, rooms, are populated with test data.

## macOS Instructions

	1.	Download or Clone the Project
	•	Ensure that you have the following files in the scripts folder:
	•	mbdatabase_create.sql
	•	insertRoomData.sql
	•	dbSetup.sh
	2.	Configure Database Credentials
	•	Open setup.sh in a text editor.
	•	Update the following variables with your MySQL credentials:

DB_USER="your_db_user"
DB_PASS="your_db_password"
DB_HOST="localhost"


	3.	Make the Shell Script Executable
	•	Open Terminal.
	•	Navigate to the scripts directory in the project:

cd path/to/your/project/scripts


	•	Make the dbSetup.sh script executable:

chmod +x dbSetup.sh


	4.	Run the Shell Script
	•	Run the dbSetup.sh file to initialize the database and insert test data:

./dbSetup.sh


	•	The script will create the database, tables, and insert room data. If any errors occur, the script will display an error message.

	5.	Verify Setup
	•	Open your MySQL client and confirm that the MB_DATABASE has been created.
	•	Check that table, rooms, is populated with room data.

After following these instructions, your local MySQL database should be initialized with the correct schema and test data.