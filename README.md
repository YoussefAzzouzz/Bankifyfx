[![Watch the video](https://raw.githubusercontent.com/YoussefAzzouzz/Bankifyfx/main/thumbnail.png)](https://raw.githubusercontent.com/YoussefAzzouzz/Bankifyfx/main/demob.mp4)

# Bankify - Système de Gestion Bancaire

Une application complète de gestion bancaire basée sur JavaFX qui offre des opérations bancaires complètes incluant la gestion de comptes, les transactions, les crédits, les assurances et le traitement des chèques.

## 📋 Fonctionnalités

### Fonctionnalités Bancaires de Base
- **Gestion des Utilisateurs** : Inscription, authentification, gestion de profil avec contrôle d'accès basé sur les rôles
- **Gestion des Comptes** : Création et gestion de comptes clients avec suivi des soldes
- **Transactions** : Traitement complet des transactions avec suivi des statuts
- **Gestion des Cartes** : Émission et gestion de cartes de crédit/débit (Visa, MasterCard)
- **Virements** : Transferts inter-comptes avec traitement en temps réel

### Fonctionnalités Avancées
- **Système de Crédit** : 
  - Demande et approbation de crédit
  - Multiples catégories de crédit avec limites personnalisables
  - Suivi et gestion des remboursements
  - Calcul des intérêts
  
- **Module d'Assurance** :
  - Gestion des polices d'assurance
  - Multiples catégories d'assurance
  - Gestion des agences
  - Suivi de la couverture

- **Gestion des Chèques** :
  - Émission et suivi des chèques
  - Gestion des bénéficiaires favoris
  - Système de réclamation de chèques

### Fonctionnalités Supplémentaires
- **Génération PDF** : Génération de rapports pour les transactions, chèques et remboursements
- **Intégration QR Code** : Génération de codes QR pour les transactions
- **Notifications Email** : Notifications email automatiques pour les événements importants
- **Intégration SMS** : Intégration Twilio pour les notifications SMS
- **Visualisation de Données** : Graphiques et statistiques pour les crédits et transactions

## 🛠️ Stack Technologique

- **Java** : JDK 17
- **JavaFX** : 22-ea+11 (Framework UI)
- **MySQL** : 8.0.33 (Base de données)
- **Maven** : Automatisation de build et gestion des dépendances
- **Apache PDFBox** : 2.0.25 (Génération PDF)
- **Apache POI** : 5.2.3 (Gestion de fichiers Excel)
- **ZXing** : 3.4.1 (Génération de codes QR)
- **Twilio SDK** : 7.41.2 (Notifications SMS)
- **ControlsFX** : 11.1.0 (Contrôles UI améliorés)
- **Gson** : 2.10.1 (Traitement JSON)

## 📁 Structure du Projet

```
Bankifyfx-Merge2/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── controllers/        # Contrôleurs UI
│   │   │   │   ├── Assurance/      # Contrôleurs d'assurance
│   │   │   │   ├── Cheques/        # Contrôleurs de chèques
│   │   │   │   ├── Compte/         # Contrôleurs de compte
│   │   │   │   ├── User/           # Contrôleurs utilisateur
│   │   │   │   └── ...
│   │   │   ├── models/             # Modèles de données
│   │   │   │   ├── Cheques/        # Modèles de chèques
│   │   │   │   └── ...
│   │   │   ├── services/           # Logique métier
│   │   │   │   ├── Assurance/      # Services d'assurance
│   │   │   │   ├── Cheques/        # Services de chèques
│   │   │   │   ├── User/           # Services utilisateur
│   │   │   │   └── ...
│   │   │   ├── utils/              # Classes utilitaires
│   │   │   └── org/example/        # Classes principales de l'application
│   │   └── resources/              # Fichiers FXML, CSS, images
│   │       ├── Assurance/
│   │       ├── Back/
│   │       ├── Cheques/
│   │       ├── Compte/
│   │       ├── Front/
│   │       ├── User/
│   │       └── ...
├── schema.sql                      # Schéma de base de données
├── pom.xml                         # Configuration Maven
└── README.md
```

## 🚀 Démarrage

### Prérequis

- **Java Development Kit (JDK) 17** ou supérieur
- **MySQL Server 8.0** ou supérieur
- **Maven** (ou utilisez le Maven Wrapper inclus)
- **Git** (pour cloner le dépôt)

### Installation

1. **Cloner le dépôt**
   ```bash
   git clone https://github.com/votrenomdutilisateur/bankify.git
   cd bankify
   ```

2. **Configurer la base de données**
   
   a. Créer une base de données MySQL :
   ```sql
   CREATE DATABASE bankify;
   ```
   
   b. Importer le schéma :
   ```bash
   mysql -u root -p bankify < schema.sql
   ```
   
   c. Mettre à jour les identifiants de la base de données dans `src/main/java/utils/MyDatabase.java` :
   ```java
   private static final String URL = "jdbc:mysql://localhost:3306/bankify";
   private static final String USER = "votre_nom_utilisateur";
   private static final String PASSWORD = "votre_mot_de_passe";
   ```

3. **Configurer les variables d'environnement** (Optionnel)
   
   Définir `JAVA_HOME` vers le chemin d'installation de votre JDK :
   ```bash
   # Windows
   set JAVA_HOME=C:\Program Files\Java\jdk-17
   
   # Linux/Mac
   export JAVA_HOME=/chemin/vers/jdk-17
   ```

4. **Compiler le projet**
   ```bash
   # Utiliser Maven Wrapper (recommandé)
   ./mvnw clean install
   
   # Ou utiliser Maven
   mvn clean install
   ```

5. **Lancer l'application**
   ```bash
   # Utiliser Maven Wrapper
   ./mvnw javafx:run
   
   # Ou utiliser Maven
   mvn javafx:run
   ```

## 🎯 Utilisation

### Exécuter Différents Points d'Entrée

L'application possède plusieurs points d'entrée :

- **Interface Backend** (`MainFX.java`) : Interface administrative backend
  ```bash
  mvn javafx:run
  ```

- **Interface Frontend** (`MainFrontFX.java`) : Connexion utilisateur et interface client
  - Modifier `pom.xml` pour changer la classe principale si nécessaire

### Connexion par Défaut

Après avoir configuré la base de données, vous devrez peut-être créer un utilisateur administrateur initial directement dans la base de données ou via l'interface d'inscription.

## 🗄️ Schéma de Base de Données

L'application utilise les tables principales suivantes :

- `user` - Comptes utilisateurs et authentification
- `compte_client` - Comptes bancaires clients
- `carte` - Cartes de crédit/débit
- `transaction` - Enregistrements de transactions
- `virement` - Virements d'argent
- `credit` - Demandes de crédit
- `categorie_credit` - Catégories de crédit
- `remboursement` - Enregistrements de remboursement
- `assurance` - Polices d'assurance
- `categorie_assurance` - Catégories d'assurance
- `agence` - Informations sur les agences
- `cheque` - Enregistrements de chèques
- `reclamtion` - Réclamations de chèques

Voir `schema.sql` pour la structure complète de la base de données.

## 🔧 Configuration

### Configuration Email

Mettre à jour les paramètres email dans l'application pour les fonctionnalités de notification :
- Configurer les paramètres SMTP dans les classes de service email
- Mettre à jour les identifiants de l'expéditeur

### Configuration SMS (Twilio)

Pour activer les notifications SMS :
1. Créer un compte Twilio
2. Obtenir votre Account SID et Auth Token
3. Mettre à jour la configuration Twilio dans les services

## 🤝 Contribution

Les contributions sont les bienvenues ! Veuillez suivre ces étapes :

1. Forker le dépôt
2. Créer une branche de fonctionnalité (`git checkout -b feature/NouvelleFonctionnalite`)
3. Commiter vos changements (`git commit -m 'Ajout d'une nouvelle fonctionnalité'`)
4. Pousser vers la branche (`git push origin feature/NouvelleFonctionnalite`)
5. Ouvrir une Pull Request

## 📝 Licence

Ce projet est sous licence MIT - voir le fichier LICENSE pour plus de détails.

## 👥 Auteurs

Youssef Azzouz

## 🙏 Remerciements

- Communauté JavaFX pour l'excellent framework UI
- Apache Foundation pour les bibliothèques PDFBox et POI
- Twilio pour les capacités d'intégration SMS

## 📞 Support

Pour obtenir de l'aide, veuillez ouvrir un ticket dans le dépôt GitHub ou contacter l'équipe de développement.

## 🐛 Problèmes Connus

- Assurez-vous que le serveur MySQL est en cours d'exécution avant de démarrer l'application
- Certaines fonctionnalités peuvent nécessiter des permissions spécifiques de base de données
- La génération PDF nécessite des permissions d'écriture dans le répertoire de l'application

## 🔮 Améliorations Futures

- [ ] API REST pour l'intégration mobile
- [ ] Rapports et analyses améliorés
- [ ] Support multilingue
- [ ] Thème mode sombre
- [ ] Authentification biométrique
- [ ] Notifications en temps réel
- [ ] Export de données vers plusieurs formats

---

**Note** : Il s'agit d'un système de gestion bancaire à des fins éducatives/de démonstration. Pour une utilisation en production, assurez-vous de mettre en place des mesures de sécurité appropriées, le chiffrement et la conformité aux réglementations bancaires.
