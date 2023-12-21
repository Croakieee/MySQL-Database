# BlogDB - MySQL Database for Blog

This MySQL database script sets up a simple database structure for a blog, including tables for users, posts, and comments. It also includes stored procedures for adding posts and comments, as well as a procedure for retrieving posts with comments.

## Features

- **Users Table:** Stores information about registered users.
- **Posts Table:** Stores information about blog posts, including the post date.
- **Comments Table:** Stores comments on blog posts, including the comment date.
- **Stored Procedures:** Provides procedures for adding posts and comments, as well as retrieving posts with comments.

## Usage

1. Create a MySQL database named `BlogDB`.
2. Run the SQL script provided in `blogdb_setup.sql` to set up the tables and procedures.
3. Include the `db_connection.php` file in your PHP application to establish a connection to the database.

### Stored Procedures

#### AddPost

Adds a new post to the `Posts` table.

```sql
CALL AddPost('Title', 'Content', UserID);

AddComment

Adds a new comment to the Comments table.

--------------------------------------------------

sql

CALL AddComment('Comment Content', UserID, PostID);

GetPostsAndComments

Retrieves a list of posts with their authors and comment counts.

----------------------------------------------------

sql

CALL GetPostsAndComments();

Database Connection (db_connection.php)

Ensure to include the db_connection.php file in your PHP application to establish a connection to the database.

------------------------------------------------------------

php

<?php
include 'db_connection.php';

// Your PHP code for interacting with the database
?>
