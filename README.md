# Moffat-Bay
Moffat Bay Lodge Website for the Bellevue University Software Development Capstone, CSD460. 

# Contributors

- Sue Sampson
- Eric Williams-Phillips
- Celine Del Mundo
- Ryan Norrbom

# Database Initialization and Data Setup

This guide will help you initialize the `MB_DATABASE` on your local MySQL server and insert sample test data.

## Prerequisites

- MySQL installed and running.
- Credentials (username and password) for a MySQL user with permissions to create and modify databases.

## Windows Instructions

1. **Download or Clone the Project**
   - Ensure that you have the following files in the `scripts` folder:
     - `mbdatabase_create.sql`
     - `insertRoomData.sql`
     - `dbSetup.bat`

2. **Configure Database Credentials**
   - Open `dbSetup.bat` in your IDE.
   - Update the following variables with your MySQL credentials:
     ```batch
     set DB_USER=your_db_user
     set DB_PASS=your_db_password
     set DB_HOST=localhost
     ```

3. **Run the Batch Script**
   - Open **Command Prompt**.
   - Navigate to the `scripts` directory in the project:
     ```cmd
     cd path\to\your\project\scripts
     ```
   - Run the `dbSetup.bat` file to initialize the database and insert test data:
     ```cmd
     dbSetup.bat
     ```
   - The script will create the database, tables, and insert room data. If any errors occur, the script will display an error message.

4. **Verify Setup**
   - Open your MySQL client and confirm that the `MB_DATABASE` has been created.
   - Check that tables, including `rooms`, are populated with test data.

---

## macOS Instructions

1. **Download or Clone the Project**
   - Ensure that you have the following files in the `scripts` folder:
     - `mbdatabase_create.sql`
     - `insertRoomData.sql`
     - `dbSetup.sh`

2. **Configure Database Credentials**
   - Open `dbSetup.sh` in a text editor.
   - Update the following variables with your MySQL credentials:
     ```bash
     DB_USER="your_db_user"
     DB_PASS="your_db_password"
     DB_HOST="localhost"
     ```

3. **Make the Shell Script Executable**
   - Open **Terminal**.
   - Navigate to the `scripts` directory in the project:
     ```bash
     cd path/to/your/project/scripts
     ```
   - Make the `dbSetup.sh` script executable:
     ```bash
     chmod +x dbSetup.sh
     ```

4. **Run the Shell Script**
   - Run the `dbSetup.sh` file to initialize the database and insert test data:
     ```bash
     ./dbSetup.sh
     ```
   - The script will create the database, tables, and insert room data. If any errors occur, the script will display an error message.

5. **Verify Setup**
   - Open your MySQL client and confirm that the `MB_DATABASE` has been created.
   - Check that the `rooms` table is populated with room data.

# Git Workflow: Branching, Refreshing, Pushing, and Creating a Pull Request

This guide details how to work with Git on or Moffat Bay project, including when creating and managing new branches, refreshing your project, pushing changes, and creating a pull request.

---

## 1. **Cloning the Repository** *(if you haven't already)*
Before creating a new branch, ensure you have cloned the repository.

```bash
git clone <repository-url>
cd <repository-folder>
```

---

## 2. **Creating a New Branch**
Always start by checking out the latest code from the main branch.

### Steps:
1. **Checkout the `main` branch:**
   ```bash
   git checkout main
   ```

2. **Pull the latest changes:**
   ```bash
   git pull origin main
   ```

3. **Create a new branch:**
   ```bash
   git checkout -b <new-branch-name>
   ```
   Replace `<new-branch-name>` with a descriptive name, such as `feature/awesome-feature` or `bugfix/fix-issue`.

---

## 3. **Refreshing the Project**
To ensure your branch is up to date with the main branch:
1. **Switch to `main` and pull the latest changes:**
   ```bash
   git checkout main
   git pull origin main
   ```

2. **Switch back to your branch:**
   ```bash
   git checkout <new-branch-name>
   ```

3. **Rebase your branch with `main` to integrate the latest changes:**
   ```bash
   git rebase main
   ```
   Resolve any merge conflicts during this step.

   If you prefer merging instead of rebasing:
   ```bash
   git merge main
   ```

---

## 4. **Making Changes**
1. Make your changes in the project files.
2. Stage the changes:
   ```bash
   git add <file-name>
   ```
   Or to add all changes:
   ```bash
   git add .
   ```

3. Commit the changes:
   ```bash
   git commit -m "Description of changes made"
   ```

---

## 5. **Pushing the Branch**
Push your branch to the remote repository:
```bash
git push origin <new-branch-name>
```

---

## 6. **Creating a Pull Request**
1. **Go to the repository** on the Git hosting service (e.g., GitHub, GitLab, Bitbucket).
2. Locate the option to create a **Pull Request** (usually a button that says "New Pull Request" or "Compare & pull request").
3. Select your branch as the source and `main` (or another target branch) as the destination.
4. Add a title and description of your changes:
   - **Title:** Briefly describe the purpose of the branch (e.g., "Add feature TYPE/NAME/DETAILS").
   - **Description:** Include details about what the code does, why the changes are necessary, and any special considerations.
5. Click **Create Pull Request**.

---

## 7. **Post Pull Request Activities**
- **Address Feedback:** Review comments from team members and make necessary changes.
- **Update the Pull Request:**
  - Make changes locally on your branch.
  - Push the changes to the same branch:
    ```bash
    git push origin <new-branch-name>
    ```

---

## Common Commands Summary

| Task                           | Command                                           |
|--------------------------------|---------------------------------------------------|
| Clone the repository            | `git clone <repository-url>`                     |
| Create and switch to a new branch | `git checkout -b <new-branch-name>`             |
| Update local `main` branch      | `git checkout main` → `git pull origin main`     |
| Rebase your branch with `main`  | `git checkout <branch>` → `git rebase main`      |
| Add changes                     | `git add <file>` or `git add .`                  |
| Commit changes                  | `git commit -m "Message"`                        |
| Push branch                     | `git push origin <branch-name>`                  |

---

## Tips
- **Branch Naming Conventions:** Use prefixes like `feature/`, `bugfix/`, or `hotfix/` to keep branches organized.
- **Pull Regularly:** Regularly pull changes from the `main` branch to minimize merge conflicts.
- **Clean Up:** Once your branch is merged, delete it locally and remotely:
  ```bash
  git branch -d <branch-name>     # Delete locally
  git push origin --delete <branch-name>  # Delete remotely
  ```

