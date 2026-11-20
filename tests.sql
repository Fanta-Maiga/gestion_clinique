-- =========================================================
-- TESTS VOLONTAIRES : exécuter chaque requête séparément.
-- Ces requêtes doivent échouer : elles vérifient les contraintes.
-- =========================================================
USE gestion_clinique;

-- TEST 1 : doublon du numéro de dossier (UNIQUE)
-- Attendu : erreur de clé dupliquée
INSERT INTO patient
(numero_dossier, nom, prenom, sexe, date_naissance, telephone)
VALUES ('PAT-001','Test','Doublon','M','2000-01-01','79999991');

-- TEST 2 : médecin lié à une spécialité inexistante (FOREIGN KEY)
-- Attendu : erreur de contrainte référentielle
INSERT INTO medecin
(numero_ordre, nom, prenom, telephone, email, id_specialite)
VALUES ('ORD-999','Test','Inconnu','79999992','test@clinique.ml',999);

-- TEST 3 : montant de consultation négatif (CHECK)
-- Attendu : erreur de contrainte CHECK
INSERT INTO consultation
(date_heure, motif, montant_consultation, statut, id_patient, id_medecin)
VALUES ('2026-11-19 10:00:00','Test montant négatif',-500,'Planifiée',1,1);

-- TEST 4 : champ obligatoire absent (NOT NULL)
-- Attendu : erreur car le nom du patient est obligatoire
INSERT INTO patient
(numero_dossier, prenom, sexe, date_naissance, telephone)
VALUES ('PAT-011','Essai','F','2000-01-01','79999993');

-- TEST 5 : suppression d'un patient déjà utilisé dans une consultation (RESTRICT)
-- Attendu : suppression refusée à cause de la clé étrangère
DELETE FROM patient WHERE id_patient = 1;
