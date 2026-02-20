# 🚌 SajiloYatra - Intercity Travel Management System

## 📋 Project Overview
SajiloYatra is a comprehensive database management system designed for an intercity travel service operating in Nepal. The system manages routes connecting major cities (Kathmandu, Pokhara, Chitwan, Butwal), passenger bookings, trip scheduling, ticket generation, and payment processing.

## 🎯 Problem Statement
The intercity travel sector in Nepal faces challenges including:
- Inefficient booking systems
- Overbooked trips
- Lack of centralized management for buses, routes, and passengers

## 💡 Solution
A modern Oracle SQL-based database system that efficiently tracks:
- Passengers and their bookings
- Trips and routes
- Bus assignments and capacity management
- Staff (drivers and conductors) allocation
- Ticket generation and payment processing

## 🏗️ Database Structure

### Core Entities
- **PASSENGER** - Customer information and preferences
- **ROUTE** - Journey paths between cities
- **BUS** - Vehicle details and capacity
- **TRIP** - Scheduled journeys with dates and times
- **STAFF** - Employee information (drivers, conductors)
- **BOOKING** - Passenger trip reservations
- **TICKET** - Confirmed booking documents
- **PAYMENT** - Financial transactions

### Key Features
- Track multiple trips per passenger
- Manage bus availability and maintenance
- Handle booking classes (Regular, Premium, VIP)
- Record payment status and methods
- Monitor trip capacity utilization

## 📊 Key Queries Implemented

### Information Queries
1. Route-wise trip counts
2. Departures from Pokhara with timings
3. Passenger names starting with 'A' and their trip counts
4. Passengers with >2 bookings in December 2025
5. January 2025 tickets with payment status

### Transaction Queries
1. Latest departure time analysis
2. Top 3 passengers by booking frequency
3. High-value passenger identification
4. Route-wise revenue generation
5. Underutilized trips (<50% capacity)

## 🛠️ Technical Specifications

### Database
- **Platform**: Oracle SQL Plus
- **Constraints**: Primary keys, Foreign keys, Check constraints
- **Referential Integrity**: Maintained across all relationships

### Data Volume
- Minimum 7 records per table
- Comprehensive test data for query validation

## 📋 Business Rules
- Each route can have multiple buses assigned
- Staff members are linked to buses for trip operations
- Tickets can exist before payment completion
- Trips can be rescheduled due to operational constraints
- Passengers can book multiple trips
- Bus capacity determines maximum bookings per trip

## 🚀 Getting Started

### Prerequisites
- Oracle SQL Plus installed
- Basic knowledge of SQL commands

### Setup Instructions
1. Run `create_tables.sql` to create database schema
2. Execute `insert_data.sql` to populate test data
3. Run query files for analysis
4. Generate dump file for backup

## 📝 Documentation
Complete documentation includes:
- Business introduction and operations
- Business rules derivation
- Initial and final ERD
- Normalization steps (1NF to 3NF)
- Data dictionary
- Implementation details
- Query results with screenshots

## 🤝 Support
For any queries regarding the database design or implementation, please refer to the documentation or contact the project maintainer.
