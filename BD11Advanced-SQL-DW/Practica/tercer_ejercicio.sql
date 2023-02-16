-- Cambia los nulos de INT a -999999
CREATE OR REPLACE FUNCTION keepcoding.borrar_enteros (entero INT64) RETURNS INT64
AS ((SELECT IF(entero IS NULL,-999999,entero)));


