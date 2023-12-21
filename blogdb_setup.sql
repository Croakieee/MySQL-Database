-- Создание базы данных
CREATE DATABASE IF NOT EXISTS BlogDB;
USE BlogDB;

-- Таблица пользователей
CREATE TABLE IF NOT EXISTS Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL,
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Таблица постов блога
CREATE TABLE IF NOT EXISTS Posts (
    PostID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Content TEXT NOT NULL,
    PostDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Таблица комментариев
CREATE TABLE IF NOT EXISTS Comments (
    CommentID INT PRIMARY KEY AUTO_INCREMENT,
    Content TEXT NOT NULL,
    CommentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UserID INT,
    PostID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID)
);

-- Процедура для добавления поста
DELIMITER //
CREATE PROCEDURE AddPost(IN p_Title VARCHAR(255), IN p_Content TEXT, IN p_UserID INT)
BEGIN
    INSERT INTO Posts (Title, Content, UserID) VALUES (p_Title, p_Content, p_UserID);
END //
DELIMITER ;

-- Процедура для добавления комментария
DELIMITER //
CREATE PROCEDURE AddComment(IN p_Content TEXT, IN p_UserID INT, IN p_PostID INT)
BEGIN
    INSERT INTO Comments (Content, UserID, PostID) VALUES (p_Content, p_UserID, p_PostID);
END //
DELIMITER ;

-- Процедура для получения списка постов с комментариями
DELIMITER //
CREATE PROCEDURE GetPostsAndComments()
BEGIN
    SELECT 
        Posts.*,
        Users.UserName AS Author,
        COUNT(Comments.CommentID) AS CommentCount
    FROM 
        Posts
        JOIN Users ON Posts.UserID = Users.UserID
        LEFT JOIN Comments ON Posts.PostID = Comments.PostID
    GROUP BY 
        Posts.PostID;
END //
DELIMITER ;
