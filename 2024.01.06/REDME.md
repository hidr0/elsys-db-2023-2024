### UML Diagram Description

1. **Authors Table**
   - `name`: VARCHAR(100) (Not Null, length > 3)
   - `email`: VARCHAR(100) (Unique, Not Null)
   - `birthdate`: DATE (Not Null)

2. **AuthorDetails Table**
   - `biography`: TEXT
   - `awards`: TEXT

3. **Books Table**
   - `title`: VARCHAR(200) (Not Null)
   - `author_name`: VARCHAR(100) (Not Null)
   - `publication_date`: DATE
   - `isbn`: VARCHAR(20) (Unique, Not Null)
   - `pages`: INT (> 0)

4. **Categories Table**
   - `name`: VARCHAR(100) (Not Null)

### Relationships

- **Authors to AuthorDetails**: One-to-One (Each author has one unique detail record)
- **Authors to Books**: One-to-Many (One author can write many books). Each book must have an author
- **Books to Categories**: Many-to-Many (Books can belong to many categories and vice versa)

### Dummy Data (Text Format)

- **Authors**:
  - Name: John Doe, Email: johndoe@example.com, Birthdate: 1975-04-12
  - Name: Jane Smith, Email: janesmith@example.com, Birthdate: 1980-11-23

- **AuthorDetails**:
  - Author Name: John Doe, Biography: "A prolific writer in the mystery genre.", Awards: "Best Mystery Writer 2003"
  - Author Name: Jane Smith, Biography: "Known for her science fiction works.", Awards: "Sci-Fi Author of the Year 2006"

- **Books**:
  - Title: Adventure in the Alps, Author Name: John Doe, Publication Date: 2001-07-16, ISBN: 1234567890123, Pages: 220
  - Title: The Future World, Author Name: Jane Smith, Publication Date: 2005-09-10, ISBN: 9876543210987, Pages: 310

- **Categories**:
  - Name: Fiction
  - Name: Science
  - Name: Adventure

- **BookCategories**:
  - Book Title: Adventure in the Alps, Category Name: Adventure
  - Book Title: The Future World, Category Name: Science
  - Book Title: The Future World, Category Name: Fiction

1. **Retrieve Author Details**: Write a query to retrieve the full profile of an author by name. Include the author's name, email, birthdate, biography, and awards.

2. **List of Books by an Author**: Write a query to list all books written by a specific author. Include the book's title, publication date, and number of pages.

3. **Books in a Category**: Write a query to find all books that belong to a specific category, such as 'Science'. Display the book titles and their authors.

4. **Count of Books in Each Category**: Write a query to count how many books are in each category. Display the category name and the number of books.

5. **Authors with No Awards**: Write a query to find all authors who have not received any awards. Display their names and biographies.

6. **Update Book Information**: Write a query to update the number of pages of a specific book. Update the book "The Future World" to have 501 pages.

7. **Delete a Book**: Write a query to delete an author from the `Books` table. Delete the Books which have more than 200 pages.

8. **Search Books by Title Keyword**: Write a query to find books whose titles contain a specific keyword, like 'World'. Display the book titles and their authors.

9. **List of Authors Born Before a Certain Year**: Write a query to list all authors born before a specific year, say 1980. Display their names and birthdates.