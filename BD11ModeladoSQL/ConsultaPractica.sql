
--- Consulta Practica SQL

select modelo.modelocoche, marca.marcacoche, grupo.grupocoche, coche.fechacompra,coche.matricula, color.color,coche.km, seguro.nombreseguro, coche.numeroseguro
from MarcosSalafranca.grupo 
join MarcosSalafranca.marca  on grupo.idgrupo = marca.idgrupo
join MarcosSalafranca.modelo on marca.idmarca = modelo.idmarca
join MarcosSalafranca.coche  on modelo.idmodelo = coche.idmodelo
join MarcosSalafranca.color  on coche.idcolor = color.idcolor
join MarcosSalafranca.seguro on coche.idseguro = seguro.idseguro
where coche.fechaventa  is null;

