# -- https://en.wikipedia.org/wiki/ISO/IEC_5218https://en.wikipedia.org/wiki/ISO/IEC_5218
#--------------------------
# Start setup
#--------------------------

# -- Configuration for the functions to work correctly --
SET GLOBAL log_bin_trust_function_creators = 1;
SET SQL_SAFE_UPDATES = 0;

# -- DATABASE name --
SET @db_name = app;

# -- DROP database --
DROP SCHEMA IF EXISTS @db_name;

# -- CREATE & USE database --
CREATE SCHEMA IF NOT EXISTS @db_name;

#--------------------------
# Creating tables
#--------------------------

# -- TABLE Customer --
CREATE TABLE IF NOT EXISTS @db_name.Customer (
    id          SERIAL, 
    name        VARCHAR(255)    NOT NULL,
    email       VARCHAR(255)    NOT NULL    UNIQUE,
    username    VARCHAR(255)    NOT NULL    UNIQUE,
    senha       VARCHAR(255)    NOT NULL,
    created_at  DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP(),
    updated_at  DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
    PRIMARY KEY (id)
);

# -- TABLE Staff --
CREATE TABLE IF NOT EXISTS @db_name.Staff (
    id          SERIAL, 
    name        VARCHAR(255)    NOT NULL,
    email       VARCHAR(255)    NOT NULL    UNIQUE,
    birth       DATE            NOT NULL,
    sex         TINYINT(1)      UNSIGNED    NOT NULL,
    cpf         VARCHAR(255)    NOT NULL,
    phone       VARCHAR(255)    NULL        DEFAULT NULL,
    username    VARCHAR(255)    NOT NULL    UNIQUE,
    senha       VARCHAR(255)    NOT NULL,
    created_at  DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP(),
    updated_at  DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
    PRIMARY KEY (id)
);

# -- TABLE Films --
CREATE TABLE IF NOT EXISTS @db_name.Films (
    id                      SERIAL,
    title                   VARCHAR(255)    NOT NULL,
    rating                  DECIMAL(2,1)    NOT NULL, # -- FIX[CRITICAL] not working decimal for placing X.X
    release                 DATE            NOT NULL,
    description             TEXT            NOT NULL,
    duration                TIME            NOT NULL, 
    price                   DECIMAL(5,2)    UNSIGNED    NOT NULL, # -- FIX[CRITICAL] test if this mf decimal placing is working
    original_language_id    VARCHAR(255)    NOT NULL,
    thumbnail               VARCHAR(2083)   NOT NULL,
    PRIMARY KEY (id)
);

    #-- TODO[] make a pk table for Flims and Directors
    #-- TODO[] make a pk table for Flims and Category
    #-- https://www.w3resource.com/sql-exercises/movie-database-exercise/sql-exercise-movie-database-24.php

# -- TABLE Director --
CREATE TABLE IF NOT EXISTS @db_name.Director (
    id          SERIAL, 
    name        VARCHAR(255)    NOT NULL,
    image       VARCHAR(2083)   NOT NULL,
    PRIMARY KEY (id)
);

# -- TABLE Category --
CREATE TABLE IF NOT EXISTS @db_name.Category (
    id          SERIAL, 
    name        VARCHAR(255)    NOT NULL,
    PRIMARY KEY (id)
);
CREATE DATABASE IF NOT EXISTS @db_name;
