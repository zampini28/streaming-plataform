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

# -- TABLE Usuario --
CREATE TABLE IF NOT EXISTS @db_name.Users (
    id          SERIAL, 
    name        VARCHAR(255)    NOT NULL,
    email       VARCHAR(255)    NOT NULL,
    username    VARCHAR(255)    NOT NULL    UNIQUE,
    senha       VARCHAR(255)    NOT NULL,
    created_at  DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP(),
    updated_at  DATETIME        NOT NULL    DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
    is_admin    TINYINT(1)      NOT NULL    DEFAULT 0,
    PRIMARY KEY (id)
);
