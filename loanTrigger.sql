CREATE TRIGGER loanTrigger 
AFTER UPDATE ON loan 
WHEN old.dateBack IS NULL AND new.dateBack IS NOT NULL
BEGIN 
REPLACE INTO BookCopy (ISBN, copyNumber, daysLoaned)
SELECT ISBN, copyNumber, BookCopy.daysLoaned + julianday(loan.dateBack)-julianday(loan.dateOut) + 1
FROM BookCopy JOIN loan USING (ISBN, copyNumber)
WHERE ISBN = new.ISBN AND copyNumber = new.copyNumber;
END