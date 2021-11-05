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

CREATE TRIGGER Update_Ocena ON Ocena49
AFTER UPDATE
AS
BEGIN
INSERT INTO Ocena_Audit 
(ID_Ocena, Akcija, Datum_Akcije, NewUcenik, OldUcenik, NewPredmet, OldPredmet, 
NewNastavnik, OldNastavnik, NewOcena, OldOcena, NewDatum, OldDatum)
(SELECT Ins.ID, 'Azuriranje', GETDATE(),
Ins.Ucenik, Del.ucenik, 
Ins.Predmet, Del.Predmet,
Ins.Nastavnik, Del.Nastavnik,
Ins.Ocena, Del.Ocena, 
Ins.Datum, Del.Datum
FROM inserted AS Ins 
JOIN deleted AS Del ON Ins.ID = Del.ID)
END

