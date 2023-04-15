CREATE VIEW ReadingHistory AS
SELECT clientId, CAST(strftime('%Y', dateOut) AS INT) AS yr, genre, COUNT(*) AS numLoans
FROM Client JOIN loan USING(clientId) JOIN BookEdition USING(ISBN)
GROUP BY yr, clientId, genre;