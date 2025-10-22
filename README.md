# 📚 MySQL Database Modeling - Level 1 & Level 2

## 📄 Description

This repository contains SQL exercises that model **Entity-Relationship diagrams** and database structures for three different scenarios:

- 🕶️ An optics shop management system  
- 🍕 An online food delivery platform  
- 📺 A simplified version of YouTube  

Each project includes:
- Relational models
- SQL scripts for table creation and relationships
- Data insertion (optional)
- Example queries

---

## 🧩 Level 1 - SQL Modeling

### 🕶️ Exercise 1 - Optics Shop ("Cul d'Ampolla")

The optics store wants to manage clients and sales of glasses. The database must store:

#### 🏪 Supplier Information:
- Name
- Address: street, number, floor, door, city, postal code, country
- Phone
- Fax
- Tax ID (NIF)

> Each brand is supplied by a **single supplier**, but a supplier may offer **multiple brands**.

#### 👓 Glasses Details:
- Brand
- Lens graduation (left and right)
- Frame type (floating, plastic, or metallic)
- Frame color
- Lens color (left and right)
- Price

#### 🧑 Clients:
- Full name
- Postal address
- Phone number
- Email
- Registration date
- Who recommended them (if applicable)

#### 👩‍💼 Employees:
- Record the employee who sold each pair of glasses

---

### 🍕 Exercise 2 - Pizzeria (Online Ordering)

A web-based system to manage food orders and deliveries.

#### 👤 Clients:
- ID, name, surname
- Address, postal code
- City and province (stored in separate tables)
- Phone number

> A **city belongs to one province**, and a **province has many cities**.

#### 📦 Orders:
- ID, date/time
- Delivery or store pickup
- Quantity of each product
- Total price
- Linked to the client who made it
- Managed by one store

#### 🍕 Products:
- Types: pizzas, burgers, drinks
- Fields: ID, name, description, image, price

#### 🍕 Pizza Categories:
- Each pizza belongs to **one category**
- Categories can change name over time

#### 🏪 Stores:
- ID, address, postal code, city, province
- A store has multiple employees

#### 👷 Employees:
- ID, name, surname, tax ID (NIF), phone
- Role: cook or delivery person

> For deliveries, store the delivery person and delivery date/time.

---

## 🧩 Level 2 - SQL Modeling

### 📺 Exercise 1 - YouTube Clone

A simplified version of YouTube with users, videos, comments, likes, channels, and playlists.

#### 👤 Users:
- ID, email, password
- Username, birthdate, gender
- Country, postal code

#### 📹 Videos:
- ID, title, description, size, filename
- Duration, thumbnail
- Views, likes, dislikes
- Status: public, private, or hidden
- Associated user and upload datetime
- Can have multiple tags

#### 🔖 Tags:
- ID and tag name
- Videos can have many tags

#### 📺 Channels:
- ID, name, description, creation date
- Created by a user
- Users can subscribe to other users’ channels

#### ❤️ Video Reactions:
- Users can like or dislike a video only **once**
- Record who liked/disliked and when

#### 🎵 Playlists:
- ID, name, creation date
- Status: public or private
- Created by a user
- Contain multiple videos

#### 💬 Comments:
- ID, text, timestamp
- Linked to user and video

#### 👍 Comment Reactions:
- Like/dislike a comment
- Record who reacted and when

---

## 💻 Technologies Used

- MySQL 8+
- SQL (DDL & DML)
- Git & GitHub
- DB Designer tools: dbdiagram.io, MySQL Workbench or similar

---

## 📋 Requirements

- **MySQL installed** locally or via services like XAMPP/MAMP
- Git CLI
- Basic SQL knowledge (CREATE, INSERT, SELECT, JOIN, etc.)

---

## 🛠️ Installation

1. **Clone the repository:**

```bash
https://github.com/christo256/S2.01---Estructura-de-dades---MySQL---Level-1---2


