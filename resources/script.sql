CREATE DATABASE yourcaryourway;
\c yourcaryourway;

CREATE TABLE USERS (
    id SERIAL PRIMARY KEY,
    lastname VARCHAR(255) NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    birthdate TIMESTAMP NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone BIGINT NOT NULL,
    country VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    postcode INT NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    role VARCHAR(20) DEFAULT 'CLIENT'
);

CREATE TABLE RESERVATIONS (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    departure_agency_id INT NOT NULL,
    return_agency_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    status VARCHAR(40) NOT NULL,
    price INT NOT NULL,
    payment_id INT NOT NULL
);

CREATE TABLE PAYMENTS (
    id SERIAL PRIMARY KEY,
    reservation_id INT NOT NULL,
    stripe_invoice_id INT NOT NULL,
    sum INT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE VEHICLES (
    id SERIAL PRIMARY KEY,
    agency_id INT,
    brand VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    transmission VARCHAR(255) NOT NULL,
    fuel VARCHAR(255) NOT NULL,
    availability BOOLEAN DEFAULT TRUE
);

CREATE TABLE AGENCIES (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    postcode INT NOT NULL,
    phone BIGINT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE MESSAGES (
    id SERIAL PRIMARY KEY,
    ticket_id INT NOT NULL,
    sender_id INT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    content VARCHAR(500) NOT NULL
);

CREATE TABLE TICKETS (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    topic VARCHAR(255) NOT NULL,
    status VARCHAR(40) NOT NULL,
    agent_id VARCHAR(40) NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_edit_date TIMESTAMP NOT NULL,
    solved_date TIMESTAMP
);

ALTER TABLE VEHICLES
    ADD CONSTRAINT fk_vehicles_agency
    FOREIGN KEY (agency_id) REFERENCES AGENCIES(id);

ALTER TABLE RESERVATIONS
    ADD CONSTRAINT fk_reservations_user
    FOREIGN KEY (user_id) REFERENCES USERS(id),
    ADD CONSTRAINT fk_reservations_departure_agency
    FOREIGN KEY (departure_agency_id) REFERENCES AGENCIES(id),
    ADD CONSTRAINT fk_reservations_return_agency
    FOREIGN KEY (return_agency_id) REFERENCES AGENCIES(id),
    ADD CONSTRAINT fk_reservations_vehicle
    FOREIGN KEY (vehicle_id) REFERENCES VEHICLES(id);

ALTER TABLE PAYMENTS
    ADD CONSTRAINT fk_payments_reservation
    FOREIGN KEY (reservation_id) REFERENCES RESERVATIONS(id);

ALTER TABLE TICKETS
    ADD CONSTRAINT fk_tickets_user
    FOREIGN KEY (user_id) REFERENCES USERS(id),
    ADD CONSTRAINT fk_tickets_agent
    FOREIGN KEY (agent_id) REFERENCES USERS(id);

ALTER TABLE MESSAGES
    ADD CONSTRAINT fk_messages_ticket
    FOREIGN KEY (ticket_id) REFERENCES TICKETS(id),
    ADD CONSTRAINT fk_messages_sender
    FOREIGN KEY (sender_id) REFERENCES USERS(id);
