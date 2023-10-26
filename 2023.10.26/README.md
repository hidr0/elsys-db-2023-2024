```
INSERT INTO Books (Title, Author, Genre, YearPublished, CopiesAvailable, TotalPages)
VALUES
("Harry Potter and the Philosopher's Stone", "J.K. Rowling", "Fantasy", 1997, 5, 309),
("To Kill a Mockingbird", "Harper Lee", "Classic", 1960, 2, 281),
("The Great Gatsby", "F. Scott Fitzgerald", "Classic", 1925, 3, 180),
("1984", "George Orwell", "Dystopian", 1949, 1, 328),
("A Wrinkle in Time", "Madeleine L'Engle", "Sci-Fi", 1962, 3, 211);
```


Absolutely, I understand. Here's the classwork example without the direct solutions.

**Scenario:**
Imagine you are tasked with creating and managing a database for a high school's library. This library has a collection of books, and the following attributes are recorded for each book:
1. Book ID
2. Title
3. Author
4. Genre
5. Year Published
6. Number of Copies Available
7. Total Pages

**Tasks:**

1. **Setup**
    - Create a database named `SchoolLibrary`.
    - Inside this database, create a table named `Books` with columns to represent the attributes mentioned above. Make sure the `BookID` is unique and auto-incrementing.

2. **INSERT INTO**
   - Insert sample data for at least five different books into the `Books` table.

3. **SELECT, WHERE, AND, OR, NOT**
   - List all the books in the database.
   - Find books written by "J.K. Rowling".
   - Find books that belong to the "Classic" or "Dystopian" genre.
   - Find books that are not from the "Fantasy" genre.

4. **ORDER BY**
   - List all books, ordered by the `YearPublished` column.

5. **UPDATE**
   - Update the "CopiesAvailable" column for a specific book of your choice.

6. **DELETE**
   - Delete a book from the table based on its title.

7. **LIMIT**
   - Display only the first three books in the table.

8. **MIN, MAX, COUNT, AVG, SUM**
   - Find the book with the minimum and maximum number of pages.
   - Count the total number of books in the library.
   - Find the average number of pages across all books.
   - Calculate the total number of pages in the library.

9. **LIKE and Wildcards**
   - Find books that have a title starting with "The".

10. **NULL Values**
   - Add a new column for "ISBN" which can be NULL to the `Books` table.
   - Find books where the ISBN value is NULL.

**Wrap-Up:**
After completing the tasks, reflect on the importance of databases in real-world scenarios. Consider discussing potential real-life applications, such as managing library systems, storing customer data in businesses, or even the role of databases in social media platforms. This discussion will help students understand the practical applications of what they've learned.