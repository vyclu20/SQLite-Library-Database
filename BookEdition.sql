CREATE TABLE BookEdition 
(ISBN TEXT(5),
title TEXT,
author TEXT,
publicationDate INTEGER,
genre TEXT,
PRIMARY KEY (ISBN),
CHECK (ISBN NOT GLOB '*[^0-9]*'),
CHECK (substr(ISBN, 5) 
LIKE (3*(FLOOR(ISBN/10000) + FLOOR(ISBN/100%100)) + 7*(FLOOR(ISBN%10000/1000) + FLOOR(ISBN%100/10)))%10));