--Autoren: Manuel Bott, Luca Moor, Timo Kaiser

-- Delete the database
DROP DATABASE IF EXISTS "AngProj" (FORCE);

-- Delete the user
DROP ROLE IF EXISTS "Admin_AngProj";

-- Create the user
CREATE ROLE "Admin_AngProj" WITH LOGIN PASSWORD '1234';


-- Create the database
CREATE DATABASE "AngProj" WITH OWNER="Admin_AngProj" ENCODING='UTF8';

\echo 'Passwort: 1234'
-- connect to DB as owner
\c -reuse-previous=on "AngProj" "Admin_AngProj"

-- create schema
\ir CreateDB.sql
