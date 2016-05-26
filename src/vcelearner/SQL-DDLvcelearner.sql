/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Teilnehmer
 * Created: 18.05.2016
 */

-- DMLs DummyDatensätze wiederherstellen

-- Datenbank vcetrainer
use vcetrainer;

-- alle DS in allen Tabellen löschen
-- AUTO_INCREMENT auf 1 setzen
TRUNCATE lernkarte2themenbereich;
TRUNCATE potentielleantwort;
DELETE FROM themenbereich;
ALTER TABLE themenbereich AUTO_INCREMENT=1;
DELETE FROM lernkarte;
ALTER TABLE lernkarte AUTO_INCREMENT=1;

-- die 7 Themenbereiche der Fragen
INSERT INTO themenbereich VALUES (NULL, "Java Basics");
INSERT INTO themenbereich VALUES (NULL, "Working with Java data types");
INSERT INTO themenbereich VALUES (NULL, "Methods and Encapsulation");
INSERT INTO themenbereich VALUES (
NULL, "String, StringBuilder, Arrays and ArrayList");
INSERT INTO themenbereich VALUES (NULL, "Flow Control");
INSERT INTO themenbereich VALUES (NULL, "Working with inheritance");
INSERT INTO themenbereich VALUES (NULL, "Exception handling");

-- Komplette Lernkarte mit PK 1 erstellen
INSERT INTO lernkarte VALUES (NULL, "Ja, wo bin ich?", NULL);
INSERT INTO lernkarte2themenbereich VALUES(NULL, 1, 1);
INSERT INTO lernkarte2themenbereich VALUES(NULL, 1, 2);
INSERT INTO potentielleantwort VALUES(NULL, "true", "qwertzu", 1);
INSERT INTO potentielleantwort VALUES(NULL, "false", "Raum 5.2", 1);
-- Komplette Lernkarte mit PK 2 erstellen
INSERT INTO lernkarte VALUES (NULL, "Frage an Alle:wie spät ist es?", NULL);
INSERT INTO lernkarte2themenbereich VALUES(NULL, 2, 1);
INSERT INTO lernkarte2themenbereich VALUES(NULL, 2, 5);
INSERT INTO potentielleantwort VALUES(NULL, "true", "12 Uhr 30", 2);
INSERT INTO potentielleantwort VALUES(NULL, "false", "6:00 Uhr", 2);
-- Komplette Lernkarte mit PK 3 erstellen
INSERT INTO lernkarte VALUES (NULL, "Wird das was?", NULL);
INSERT INTO lernkarte2themenbereich VALUES(NULL, 3, 3);
INSERT INTO lernkarte2themenbereich VALUES(NULL, 3, 4);
INSERT INTO potentielleantwort VALUES(NULL, "true", "na klar", 3);
INSERT INTO potentielleantwort VALUES(NULL, "false", "mal sehen", 3);
-- Komplette Lernkarte mit PK 4 erstellen
INSERT INTO lernkarte VALUES (NULL, "Geht noch eine?", NULL);
INSERT INTO lernkarte2themenbereich VALUES(NULL, 4, 6);
INSERT INTO lernkarte2themenbereich VALUES(NULL, 4, 7);
INSERT INTO potentielleantwort VALUES(NULL, "true", "immer doch", 4);
INSERT INTO potentielleantwort VALUES(NULL, "false", "nö heute nicht", 4);