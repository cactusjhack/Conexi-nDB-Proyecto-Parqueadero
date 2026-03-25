🅿️ Mall Plaza Parking System — Database & Application Layer
Academic project developed as part of the Software Development Technology program at ITM (Instituto Tecnológico Metropolitano), Medellín, Colombia.
This repository contains the full application implementation of the Mall Plaza parking management system, including database integration, business logic layer, console interface, and unit tests.

🏗️ Project Structure
Parqueadero/
├── lib_aplicaciones/        # Business logic & data access layer (C#)
├── Presentacion de consola/ # Console UI — entry points and user interaction
└── pruebas_unitarias/       # Unit tests for core business logic

✨ Features

Vehicle entry and exit registration
Parking spot availability tracking by zone
Billing calculation based on vehicle type and time
SQL Server database integration via direct connection
Unit tests covering core operations


🛠️ Tech Stack
LayerTechnologyLanguageC# (.NET)DatabaseSQL Server (T-SQL)ArchitectureMulti-project solution (Visual Studio)TestingUnit Tests (pruebas_unitarias)UIConsole Application

🗄️ Database
The system uses SQL Server with a relational schema designed to handle:

Vehicle and customer records
Parking spot assignments
Transaction and billing history


SQL scripts for schema creation are included in the repository.


🚀 Getting Started
Prerequisites

Visual Studio 2022+
.NET SDK 8.0+
SQL Server (local instance or SQL Server Express)

Setup

Clone the repository

bash   git clone https://github.com/cactusjhack/Conexi-nDB-Proyecto-Parqueadero.git

Open Parqueadero.sln in Visual Studio
Update the connection string in the configuration to point to your SQL Server instance
Run the SQL scripts to create the database schema
Build and run the Presentacion de consola project


🔗 Related Repository
This project is the evolution of the initial domain model:
👉 Parking System — Domain Model & Class Design

👤 Author
Jhackson Palacios Perea
Software Development Student — ITM, Medellín, Colombia
github.com/cactusjhack
