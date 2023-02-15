-- Cambia los nulos de INT a -999999
CREATE OR REPLACE FUNCTION keepcoding.borrar_enteros (entero INT64) RETURNS INT64
AS ((SELECT IF(entero IS NULL,-999999,entero)));




/*
-- Cambia los strings 'NULL' y los nulos a -999999
CREATE OR REPLACE FUNCTION keepcoding.borrar_string (string STRING) RETURNS INT64
AS ((SELECT IF(UPPER(string)='NULL' OR string IS NULL,-999999,string)));
*/