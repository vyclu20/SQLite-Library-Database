# SQLite-Library-Database
Project was last updated on: 13 October 2022

**This was a university project for a relational database management unit.**

I did not upload the actual database and project outline to avoid any potential violation of academic conduct. Even though I am unsure of the specifics, I didn't want to risk it. The code used in this project received a grade of above 85%.

## Project Overview

The context of the project was to assist a library in migrating their database from an Excel spreadsheet to SQLite, as the existing database was becoming unwieldy. It involved identifying keys, setting up referential integrity constraints, implementing checks, making triggers and views to ensure the smooth and accurate functioning of the database.


The database consists of four tables: 
> BookEdition: 5 columns "ISBN" (text), "title" (text), "author" (text), "publicationDate" (integer), and "genre" (text). These columns are to store information about books, such as their ISBN number, title, author, publication date, and genre where each row of BookEdition is uniquely identified by its ISBN.

> BookCopy: 3 columns "ISBN" (text), "copyNumber" (integer), and "daysLoaned" (integer). These columns are to store information about copies of books, such as their ISBN number, copy number (which would indicate which copy of one book is being borrowed), and the cumulative number of days the copy has been loaned out. The table BookEdition contains many more books than the library can possibly buy, and so SCML may have zero, one or more actual copies of each of the books listed in BookEdition.

> loan: 5 columns "clientId" (integer), "ISBN" (text), "copyNumber" (integer), "dateOut" (text), and "dateBack" (text). These columns are to store information about loans, such as the client ID, ISBN number of the book loaned, the copy number of the book, the dates the book was checked out and the book was returned in YYYY-MM-DD form. Anytime a new tuple is entered into the table loan on the day that the book is loaned out, with the value NULL assigned to the column dateBack, and when a book is returned an update statement is to run to update daysLoaned column in the BookCopy table. This is where the trigger comes in handy.

> Client: 3 columns "clientId" (integer), "name" (text), and "residence" (text). These columns are to store information about clients, such as their unique client ID, name, and residence. Each client has a unique clientId and the library also keeps information about the client’s name and their aged-care residence and a client can be registered in the Client table even if they have not (yet) borrowed any books.

The repo contains 6 sql files including a view (ReadingHistory) to store information about a client's reading history, such as their unique client ID, the year they read a book, the genre of the book, and the number of loans for that book.
