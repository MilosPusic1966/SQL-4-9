use MilosP2021
CREATE TRIGGER Insert_Ocena ON Ocena49
AFTER INSERT
AS
BEGIN
INSERT INTO Ocena_Audit 
(ID_Ocena, Akcija, Datum_Akcije, NewUcenik, NewPredmet, NewNastavnik,
NewOcena, NewDatum) (SELECT ID, 'Dodavanje', GETDATE(),
Ucenik, Predmet, Nastavnik, Ocena, Datum FROM inserted)
END

INSERT INTO Ocena49 VALUES ('Muzurovic', 'Baze', 'Pusic', 3, '2021-11-1')