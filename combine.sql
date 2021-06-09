BEGIN;
UPDATE Persons p
SET name = newp.name, address = newp.address, salary = newp.salary, canBePLayer = False, canBeCoach = False
FROM PersonChanges newp
WHERE p.personID = newp.personID
;

INSERT INTO Persons
SELECT newp.personID, newp.name, newp.address, newp.salary, True, NULL
FROM PersonChanges newp
WHERE newp.personID NOT IN(
                SELECT personID
                FROM Persons
                )
;

COMMIT;
