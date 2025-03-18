The Employee Management System (EMS) is a comprehensive database solution designed to streamline HR operations, including employee records, job roles, leave tracking, attendance, salary management, and project assignments. With a normalized data model and temporal versioning, EMS ensures efficient data retrieval, auditing, and compliance. It supports multi-user access, integrates with payroll and reporting modules, and enhances workforce management through structured automation.
The 15-Day Data Recovery Policy ensures that deleted or modified data can be restored within 15 days of the change. During this period, backups are securely retained, allowing recovery in case of accidental deletion, corruption, or system failure. After 15 days, data is permanently removed unless archived separately. This policy enhances data integrity, minimizes downtime, and aligns with compliance and security standards for business continuity.
The User Log tracks user activities, including logins, updates, and access history for security and auditing. The Data Recovery Log records all recovery operations, including timestamps, restored data, and user actions, ensuring compliance with the 15-Day Data Recovery Policy. The Error Log captures system errors, failures, and exceptions for troubleshooting and performance monitoring, aiding in quick issue resolution and system stability.
The User Log & Error Log Retention Policy ensures that logs are retained for one month before automatic deletion. The User Log records login history, access details, and activity tracking, while the Error Log captures system failures and exceptions for debugging. After 30 days, logs are purged to optimize storage and maintain system performance. Critical logs can be archived separately for compliance or auditing needs, ensuring security and operational efficiency.

Database Folder Sturchure Explaination 
/database-project  
│── /schemas  
│   ├── create_tables.sql  
│   ├── alter_tables.sql  
│   ├── drop_tables.sql  
│── /migrations  
│   ├── v1_initial_setup.sql  
│   ├── v2_add_new_columns.sql  
│── /seeds  
│   ├── sample_data.sql  
│── /procedures  
│   ├── stored_procedures.sql  
│── /functions  
│   ├── user_defined_functions.sql  
│── /triggers  
│   ├── triggers.sql  
│── /views  
│   ├── views_definition.sql  
│── /indexes  
│   ├── indexes.sql  
│── /constraints  
│   ├── foreign_keys.sql  
│── /performance  
│   ├── indexing_strategy.sql  
│   ├── query_optimization.sql  
│── /backup  
│   ├── full_backup.bak  
│   ├── differential_backup.bak  
│── /docs  
│   ├── README.md  
│   ├── database_architecture.pdf  
│── .gitignore  
│── README.md  
│── LICENSE  

📑 Schemas (/schemas/)
Contains SQL scripts to create, modify, and drop tables.

create_tables.sql → Defines the database tables and schema.
alter_tables.sql → Includes modifications such as adding or altering columns.
drop_tables.sql → Scripts for dropping tables (used for cleanup).

🔄 Migrations (/migrations/)
Tracks changes in the database schema over time. Each script represents a version update.

v1_initial_setup.sql → The first database schema version.
v2_add_new_columns.sql → Example of schema changes (e.g., adding new columns).

📊 Seeds (/seeds/)
Contains sample data to populate tables for testing or development.

sample_data.sql → Initial dataset for testing.

⚙️ Stored Procedures (/procedures/)
Stores complex business logic as reusable SQL procedures.

stored_procedures.sql → Contains stored procedures used in the database.

🔢 Functions (/functions/)
Holds user-defined functions (UDFs) that perform calculations or transformations.

user_defined_functions.sql → Collection of custom functions.

🔔 Triggers (/triggers/)
Contains SQL triggers that automate database actions based on conditions.

triggers.sql → Trigger definitions.

👀 Views (/views/)
Stores SQL views that simplify querying by encapsulating logic.

views_definition.sql → SQL statements for views.

⚡ Indexes (/indexes/)
Manages indexing strategies to optimize database performance.

indexes.sql → Index creation scripts.

🔗 Constraints (/constraints/)
Defines foreign key constraints and other integrity rules.

foreign_keys.sql → Defines relationships between tables.

🚀 Performance (/performance/)
Includes strategies for database tuning and optimization.

indexing_strategy.sql → Indexing techniques for performance.
query_optimization.sql → Query tuning best practices.

🛑 Backup (/backup/)
Stores database backup files.

full_backup.bak → A complete database backup.
differential_backup.bak → A smaller backup with only recent changes.

📜 Miscellaneous
.gitignore → Prevents unnecessary files from being committed (e.g., .bak backups).
README.md → The main documentation for this repository.
LICENSE → Open-source or proprietary license details.
database_architecture.pdf → ERD and other database diagrams.


