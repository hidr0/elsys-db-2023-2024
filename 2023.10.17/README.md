**Scenario:**

You are working as a database manager for a school. The school wants to maintain a database to store information about students and courses.

**Tasks:**

1. **Create a New Database:**
   - Create a database named `SchoolDB`.

2. **Create Tables:**
   - Create a `Students` table with the following columns:
     - `StudentID` (Primary Key, Auto-Increment)
     - `FirstName`
     - `LastName`
     - `DOB` (Date of Birth)
     - `Address`
   - Create a `Courses` table with the following columns:
     - `CourseID` (Primary Key, Auto-Increment)
     - `CourseName`
     - `CourseDescription`

3. **Insert Data:**
   - Insert at least 5 students into the `Students` table. Make sure some students share the same address for query purposes.
   - Insert at least 3 courses into the `Courses` table.

4. **Retrieve Data:**
   - Use the `SELECT` statement to retrieve all students who live at "123 Elm Street".
   - Use the `SELECT` statement combined with `AND` and `WHERE` to retrieve all students named "John" who were born after 2000.
   - Use the `SELECT` statement with `OR` to retrieve all courses named "Mathematics" or "History".
   - Use the `SELECT` statement to retrieve all students whose address is `NULL`.

5. **Update Data:**
   - Change the address of student with `StudentID = 3` to "456 Oak Avenue" using the `UPDATE` statement.
   - Update the course description of "Mathematics" to include "An introduction to basic algebra and geometry."

6. **Delete Data:**
   - Delete the student record of anyone named "Jane Doe" using the `DELETE` statement.
   - Delete the course named "Physical Education".

**Bonus Task:**

- Use the `ALTER TABLE` command to add a new column called `Email` to the `Students` table. Then, update the records of students with `StudentID = 1` and `StudentID = 2` to add email addresses for them.