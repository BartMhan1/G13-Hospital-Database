# G13 Hospital Database Management System

Welcome to the **G13 Hospital Database Management System** repository. This project contains the complete database design, implementation, and security models for a modern hospital management system.

## Project Structure

The repository is organized as follows:

```text
G13-Hospital-Database/
│
├── README.md
│
├── sql/
│   ├── 01_schema/
│   │   └── create_tables.sql
│   ├── 02_data/
│   │   └── insert_data.sql
│   ├── 03_queries/
│   │   ├── queries_q1_q3.sql
│   │   └── queries_q4_q7.sql
│   ├── 04_security/
│   │   └── roles_and_privileges.sql
│   ├── 05_views_triggers/
│   │   ├── views.sql
│   │   └── trigger.sql
│   └── 06_backup/
│       └── backup_script.sql
│
├── diagrams/
│   ├── er_diagram/
│   │   └── README.md
│   └── system_architecture/
│       └── README.md
│
├── documentation/
│   ├── executive_summary/
│   │   └── README.md
│   └── individual_contributions/
│       └── README.md
│
└── presentation/
    └── README.md
```

## Directory Overview

*   **`sql/`**: Contains all SQL scripts needed to build, populate, query, and secure the database.
    *   `01_schema/`: Database schema definitions (tables, constraints, foreign keys).
    *   `02_data/`: Seed/mock data for testing.
    *   `03_queries/`: Specific analysis and operational queries.
    *   `04_security/`: Role-Based Access Control (RBAC) scripts and user privileges.
    *   `05_views_triggers/`: Database views and triggers for automated logic.
    *   `06_backup/`: Database backup and recovery procedures/scripts.
*   **`diagrams/`**: Visual models of the system.
    *   `er_diagram/`: Entity-Relationship diagrams showing the logical and physical models.
    *   `system_architecture/`: System deployment and database architecture diagrams.
*   **`documentation/`**: Written reports.
    *   `executive_summary/`: Project goals, scope, and high-level summaries.
    *   `individual_contributions/`: Breakdown of contributions per team member.
*   **`presentation/`**: Slidedecks and presentation materials for the final project delivery.

## Getting Started

1.  **Schema Setup**: Execute `sql/01_schema/create_tables.sql` to initialize the database tables.
2.  **Data Ingestion**: Populate the database by running `sql/02_data/insert_data.sql`.
3.  **Security and Roles**: Run `sql/04_security/roles_and_privileges.sql` to configure roles and privileges.
4.  **Views and Triggers**: Set up automated logic with `sql/05_views_triggers/views.sql` and `sql/05_views_triggers/trigger.sql`.
5.  **Queries**: Run queries under `sql/03_queries/` to test and extract insights.
