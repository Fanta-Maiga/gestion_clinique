-- =========================================================
-- PROJET : Gestion d'une clinique
-- FICHIER : schema.sql
-- SGBD : MySQL 8.0.16+
-- =========================================================

CREATE DATABASE IF NOT EXISTS gestion_clinique
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE gestion_clinique;

-- Suppression dans l'ordre des dépendances pour permettre la réexécution
DROP TABLE IF EXISTS paiement;
DROP TABLE IF EXISTS facture;
DROP TABLE IF EXISTS consultation;
DROP TABLE IF EXISTS medecin;
DROP TABLE IF EXISTS specialite;
DROP TABLE IF EXISTS patient;

CREATE TABLE patient (
    id_patient INT AUTO_INCREMENT PRIMARY KEY,
    numero_dossier VARCHAR(20) NOT NULL UNIQUE,
    nom VARCHAR(80) NOT NULL,
    prenom VARCHAR(80) NOT NULL,
    sexe ENUM('F','M','Autre') NOT NULL,
    date_naissance DATE NOT NULL,
    telephone VARCHAR(20) NOT NULL UNIQUE,
    adresse VARCHAR(180),
    date_creation DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE specialite (
    id_specialite INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE medecin (
    id_medecin INT AUTO_INCREMENT PRIMARY KEY,
    numero_ordre VARCHAR(30) NOT NULL UNIQUE,
    nom VARCHAR(80) NOT NULL,
    prenom VARCHAR(80) NOT NULL,
    telephone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(120) UNIQUE,
    id_specialite INT NOT NULL,
    CONSTRAINT fk_medecin_specialite
      FOREIGN KEY (id_specialite) REFERENCES specialite(id_specialite)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE consultation (
    id_consultation INT AUTO_INCREMENT PRIMARY KEY,
    date_heure DATETIME NOT NULL,
    motif VARCHAR(255) NOT NULL,
    diagnostic TEXT,
    montant_consultation DECIMAL(10,2) NOT NULL,
    statut ENUM('Planifiée','Terminée','Annulée') NOT NULL DEFAULT 'Planifiée',
    id_patient INT NOT NULL,
    id_medecin INT NOT NULL,
    CONSTRAINT chk_montant_consultation CHECK (montant_consultation >= 0),
    CONSTRAINT fk_consultation_patient
      FOREIGN KEY (id_patient) REFERENCES patient(id_patient)
      ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_consultation_medecin
      FOREIGN KEY (id_medecin) REFERENCES medecin(id_medecin)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE facture (
    id_facture INT AUTO_INCREMENT PRIMARY KEY,
    numero_facture VARCHAR(30) NOT NULL UNIQUE,
    date_facture DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    montant_total DECIMAL(10,2) NOT NULL,
    statut ENUM('Non payée','Partiellement payée','Payée') NOT NULL DEFAULT 'Non payée',
    id_consultation INT NOT NULL UNIQUE,
    CONSTRAINT chk_montant_facture CHECK (montant_total >= 0),
    CONSTRAINT fk_facture_consultation
      FOREIGN KEY (id_consultation) REFERENCES consultation(id_consultation)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE paiement (
    id_paiement INT AUTO_INCREMENT PRIMARY KEY,
    reference_paiement VARCHAR(40) NOT NULL UNIQUE,
    date_paiement DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    montant DECIMAL(10,2) NOT NULL,
    mode_paiement ENUM('Espèces','Orange Money','Wave','Carte bancaire','Virement') NOT NULL,
    id_facture INT NOT NULL,
    CONSTRAINT chk_montant_paiement CHECK (montant > 0),
    CONSTRAINT fk_paiement_facture
      FOREIGN KEY (id_facture) REFERENCES facture(id_facture)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;
