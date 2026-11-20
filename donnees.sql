-- =========================================================
-- PROJET : Gestion d'une clinique
-- FICHIER : donnees.sql
-- 10 lignes d'essai par table principale
-- À exécuter après schema.sql
-- =========================================================

USE gestion_clinique;

INSERT INTO patient
(numero_dossier, nom, prenom, sexe, date_naissance, telephone, adresse)
VALUES
('PAT-001','Traoré','Aminata','F','1998-03-12','70000001','Bamako - ACI'),
('PAT-002','Diallo','Moussa','M','1985-07-21','70000002','Bamako - Kalaban'),
('PAT-003','Coulibaly','Fatoumata','F','2001-11-02','70000003','Bamako - Badalabougou'),
('PAT-004','Maïga','Ibrahim','M','1979-01-18','70000004','Bamako - Lafiabougou'),
('PAT-005','Sangaré','Aïssata','F','1992-05-30','70000005','Bamako - Hamdallaye'),
('PAT-006','Konaté','Oumar','M','1990-09-14','70000006','Bamako - Sogoniko'),
('PAT-007','Diarra','Mariam','F','2004-02-09','70000007','Bamako - Faladié'),
('PAT-008','Touré','Abdoulaye','M','1968-12-25','70000008','Bamako - Niamakoro'),
('PAT-009','Keïta','Hawa','F','1988-06-16','70000009','Bamako - Djicoroni'),
('PAT-010','Cissé','Boubacar','M','1995-10-05','70000010','Bamako - Magnambougou');

INSERT INTO specialite (libelle, description) VALUES
('Médecine générale','Consultations médicales générales'),
('Pédiatrie','Santé des enfants'),
('Cardiologie','Maladies du cœur'),
('Dermatologie','Maladies de la peau'),
('Gynécologie','Santé gynécologique'),
('Ophtalmologie','Santé des yeux'),
('ORL','Oto-rhino-laryngologie'),
('Neurologie','Système nerveux'),
('Dentisterie','Soins dentaires'),
('Radiologie','Examens d’imagerie');

INSERT INTO medecin
(numero_ordre, nom, prenom, telephone, email, id_specialite)
VALUES
('ORD-001','Berthe','Mamadou','71000001','m.berthe@clinique.ml',1),
('ORD-002','Sow','Awa','71000002','a.sow@clinique.ml',2),
('ORD-003','Dembélé','Cheick','71000003','c.dembele@clinique.ml',3),
('ORD-004','Sidibé','Rokia','71000004','r.sidibe@clinique.ml',4),
('ORD-005','Sissoko','Mariam','71000005','m.sissoko@clinique.ml',5),
('ORD-006','Camara','Adama','71000006','a.camara@clinique.ml',6),
('ORD-007','Fofana','Issa','71000007','i.fofana@clinique.ml',7),
('ORD-008','Barry','Ousmane','71000008','o.barry@clinique.ml',8),
('ORD-009','Diakité','Nana','71000009','n.diakite@clinique.ml',9),
('ORD-010','Koné','Moussa','71000010','m.kone@clinique.ml',10);

INSERT INTO consultation
(date_heure, motif, diagnostic, montant_consultation, statut, id_patient, id_medecin)
VALUES
('2026-11-01 09:00:00','Fièvre et fatigue','Paludisme simple suspecté',10000,'Terminée',1,1),
('2026-11-02 10:00:00','Contrôle enfant','État général satisfaisant',12000,'Terminée',2,2),
('2026-11-03 11:30:00','Douleur thoracique','Bilan cardiologique demandé',20000,'Terminée',3,3),
('2026-11-04 08:30:00','Éruption cutanée','Dermatite à confirmer',15000,'Terminée',4,4),
('2026-11-05 14:00:00','Consultation gynécologique','Suivi de routine',18000,'Terminée',5,5),
('2026-11-06 09:30:00','Baisse de vision','Trouble visuel à corriger',15000,'Terminée',6,6),
('2026-11-07 10:15:00','Douleur à l’oreille','Otite probable',12000,'Terminée',7,7),
('2026-11-08 13:00:00','Maux de tête','Examens complémentaires demandés',20000,'Terminée',8,8),
('2026-11-09 15:00:00','Douleur dentaire','Caries à traiter',10000,'Terminée',9,9),
('2026-11-10 08:00:00','Examen radiologique','Compte rendu disponible',25000,'Terminée',10,10);

INSERT INTO facture
(numero_facture, date_facture, montant_total, statut, id_consultation)
VALUES
('FAC-001','2026-11-01 09:30:00',10000,'Payée',1),
('FAC-002','2026-11-02 10:30:00',12000,'Payée',2),
('FAC-003','2026-11-03 12:00:00',20000,'Payée',3),
('FAC-004','2026-11-04 09:00:00',15000,'Payée',4),
('FAC-005','2026-11-05 14:30:00',18000,'Payée',5),
('FAC-006','2026-11-06 10:00:00',15000,'Payée',6),
('FAC-007','2026-11-07 10:45:00',12000,'Payée',7),
('FAC-008','2026-11-08 13:30:00',20000,'Payée',8),
('FAC-009','2026-11-09 15:30:00',10000,'Payée',9),
('FAC-010','2026-11-10 08:30:00',25000,'Payée',10);

INSERT INTO paiement
(reference_paiement, date_paiement, montant, mode_paiement, id_facture)
VALUES
('PAY-001','2026-11-01 09:35:00',10000,'Espèces',1),
('PAY-002','2026-11-02 10:35:00',12000,'Orange Money',2),
('PAY-003','2026-11-03 12:05:00',20000,'Wave',3),
('PAY-004','2026-11-04 09:05:00',15000,'Espèces',4),
('PAY-005','2026-11-05 14:35:00',18000,'Orange Money',5),
('PAY-006','2026-11-06 10:05:00',15000,'Carte bancaire',6),
('PAY-007','2026-11-07 10:50:00',12000,'Espèces',7),
('PAY-008','2026-11-08 13:35:00',20000,'Virement',8),
('PAY-009','2026-11-09 15:35:00',10000,'Wave',9),
('PAY-010','2026-11-10 08:35:00',25000,'Espèces',10);
