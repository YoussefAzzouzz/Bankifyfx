-- Complete Database Schema for Bankify
-- Run this script to create all required tables

-- User table
CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    dateNaissance DATE,
    genre VARCHAR(50),
    verified BOOLEAN DEFAULT FALSE,
    role VARCHAR(50) DEFAULT 'client',
    isActive BOOLEAN DEFAULT TRUE,
    picture VARCHAR(500)
);

-- Compte Client table
CREATE TABLE IF NOT EXISTS compte_client (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    rib VARCHAR(255),
    mail VARCHAR(255),
    tel VARCHAR(255),
    solde FLOAT,
    sexe VARCHAR(50)
);

-- Agence table
CREATE TABLE IF NOT EXISTS agence (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_agence VARCHAR(255),
    email_agence VARCHAR(255),
    tel_agence VARCHAR(255)
);

-- Categorie Credit table
CREATE TABLE IF NOT EXISTS categorie_credit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255),
    min_montant DOUBLE,
    max_montant DOUBLE
);

-- Credit table
CREATE TABLE IF NOT EXISTS credit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    interet INT,
    duree_totale INT,
    montant_totale DOUBLE,
    date_c DATE,
    payed BOOLEAN DEFAULT FALSE,
    accepted BOOLEAN DEFAULT FALSE,
    compte_id INT,
    categorie_id INT,
    FOREIGN KEY (compte_id) REFERENCES compte_client(id) ON DELETE CASCADE,
    FOREIGN KEY (categorie_id) REFERENCES categorie_credit(id) ON DELETE CASCADE
);

-- Remboursement table
CREATE TABLE IF NOT EXISTS remboursement (
    id INT AUTO_INCREMENT PRIMARY KEY,
    duree_restante INT,
    montant_r DOUBLE,
    montant_restant DOUBLE,
    date_r DATE,
    credit_id INT,
    FOREIGN KEY (credit_id) REFERENCES credit(id) ON DELETE CASCADE
);

-- Categorie Assurance table
CREATE TABLE IF NOT EXISTS categorie_assurance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_categorie VARCHAR(255),
    description TEXT,
    TypeCouverture VARCHAR(255),
    agenceResponsable VARCHAR(255)
);

-- Assurance table
CREATE TABLE IF NOT EXISTS assurance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_assurance VARCHAR(255),
    montant_prime DOUBLE,
    nom_assure VARCHAR(255),
    nom_beneficiaire VARCHAR(255),
    info_assurance TEXT
);

-- Transaction table
CREATE TABLE IF NOT EXISTS transaction (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    montant DOUBLE,
    date_t DATE,
    type_t VARCHAR(255),
    statut_t VARCHAR(255)
);

-- Carte table
CREATE TABLE IF NOT EXISTS carte (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    num_c VARCHAR(255),
    date_exp DATE,
    type_c VARCHAR(255),
    statut_c VARCHAR(255),
    account_id INT,
    FOREIGN KEY (account_id) REFERENCES compte_client(id) ON DELETE SET NULL
);

-- Virement table
CREATE TABLE IF NOT EXISTS virement (
    id INT AUTO_INCREMENT PRIMARY KEY,
    compte_source VARCHAR(255),
    compte_destination VARCHAR(255),
    montant FLOAT,
    date DATE,
    heure TIME
);

-- Cheque table
CREATE TABLE IF NOT EXISTS cheque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    is_fav INT DEFAULT 0,
    destination_c_id INT,
    compte_id_id INT,
    montant_c FLOAT,
    date_emission DATE DEFAULT (CURRENT_DATE)
);

-- Reclamation table (note: the service uses 'Reclamtion' but this is likely a typo)
CREATE TABLE IF NOT EXISTS reclamtion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cheque_id_id INT,
    categorie VARCHAR(255),
    statut_r VARCHAR(255) DEFAULT 'En Cours',
    FOREIGN KEY (cheque_id_id) REFERENCES cheque(id) ON DELETE CASCADE
);
