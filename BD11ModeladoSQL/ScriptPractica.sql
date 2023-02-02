-- Script de la practica --


create schema MarcosSalafranca authorization hqpgyxfb;

--- 1. Tablas de referencia ---

--Tabla Grupo
create table MarcosSalafranca.grupo(
    idGrupo varchar(10) not null,     --PK  FK
    grupocoche varchar (20) not null
);

--Tabla Marca
create table MarcosSalafranca.marca(
    idMarca varchar(10) not null,       --PK FK
    idgrupo varchar (20) not null,   --FK
    marcaCoche varchar(20) not null
);

--Tabla Modelo
create table MarcosSalafranca.modelo(
    idModelo varchar(10) not null,       --PK FK
    idmarca varchar(20) not null,     --FK
    modelocoche varchar (20) not null       
);

--Tabla Coche
create table MarcosSalafranca.coche(
	idcoche varchar(10)  not null,     --PK FK
	fechaCompra date not null,     
	idmodelo varchar(10) not null, --FK
	idcolor varchar(10) not null,        --FK
	idseguro varchar(10) not null, --FK
	matricula varchar(20) not null,  
	km varchar(20) not null,  
	numeroSeguro varchar(20) not null,   
	fechaVenta date null
);

--Tabla Color
create table MarcosSalafranca.color(
    idColor varchar(10) not null,     --PK FK
    color varchar (10) not null   
);

--Tabla Seguro
create table MarcosSalafranca.seguro(
    idseguro varchar(10) not null,     --PK FK
    nombreSeguro varchar (20) not null   
);

--Tabla NumeroRevisiones
create table MarcosSalafranca.revisioncoche(
    idnumerorevision varchar(10) null,   --PK
    idrevision varchar(10) not null,     --PK FK
    idcoche varchar(10) not null,        --PK FK 
    fecharevision date not null 
); 


--Tabla Revisiones
create table MarcosSalafranca.revision(
    idrevision varchar(10) not null,    --PK        
    idmoneda varchar (10) not null,     --FK
    km varchar(20) not null,  
    importe varchar(20) not null  
);

--Tabla TipoMoneda
create table MarcosSalafranca.tipoMoneda(
    idMoneda varchar(10) not null,     --PK FK
    nombreMoneda varchar (10) not null   
);


--- 2. Primary Keys ---

--PK
alter table MarcosSalafranca.grupo 
add constraint grupo_PK primary key (idGrupo);

--PK
alter table MarcosSalafranca.marca 
add constraint marca_PK primary key (idMarca);

--PK
alter table MarcosSalafranca.modelo 
add constraint modelo_PK primary key (idModelo);

--PK
alter table MarcosSalafranca.coche
add constraint coche_PK primary key (idcoche);

--PK
alter table MarcosSalafranca.tipomoneda 
add constraint tipoMoneda_PK primary key (idmoneda);
--PK
alter table MarcosSalafranca.revisioncoche 
add constraint revisioncoche_PK primary key (idrevision, idcoche, idNumeroRevision);

--PK
alter table MarcosSalafranca.revision 
add constraint revision_PK primary key (idrevision);

--PK
alter table MarcosSalafranca.seguro
add constraint seguro_PK primary key (idseguro);

--PK
alter table MarcosSalafranca.color
add constraint color_PK primary key (idcolor);


--- 3. Foreing Keys ---

--FK 
alter table MarcosSalafranca.marca 
add constraint marca_grupo_FK foreign key (idGrupo)
references MarcosSalafranca.grupo(idGrupo);

--FK
alter table MarcosSalafranca.modelo
add constraint modelo_marca_FK foreign key (idmarca)
references MarcosSalafranca.marca(idmarca);

--FK
alter table MarcosSalafranca.coche
add constraint coche_modelo_FK foreign key (idmodelo)
references MarcosSalafranca.modelo(idmodelo);

--FK
alter table MarcosSalafranca.coche
add constraint coche_color_FK foreign key (idcolor)
references MarcosSalafranca.color(idcolor);

--FK
alter table MarcosSalafranca.revisioncoche
add constraint coche_revisioncoche_FK foreign key (idcoche)
references MarcosSalafranca.coche(idcoche);

--FK
alter table MarcosSalafranca.revisioncoche
add constraint revision_revisioncoche_FK foreign key (idrevision)
references MarcosSalafranca.revision(idrevision);

--FK
alter table MarcosSalafranca.revision
add constraint revision_tipoMoneda_FK foreign key (idmoneda)
references MarcosSalafranca.tipoMoneda(idmoneda);

--FK
alter table MarcosSalafranca.coche
add constraint coche_seguro_FK foreign key (idseguro)
references MarcosSalafranca.seguro(idseguro);




---- 4. DML ---

--Insert Grupo
insert into MarcosSalafranca.grupo (idgrupo, grupocoche)
values('01','VAG');

insert into MarcosSalafranca.grupo (idgrupo, grupocoche)
values('02','BMW');

insert into MarcosSalafranca.grupo (idgrupo, grupocoche)
values('03','Stellantis');

insert into MarcosSalafranca.grupo (idgrupo, grupocoche)
values('04','Renault-Nissan');


--Insert Marca
insert into MarcosSalafranca.marca (idmarca, idgrupo, marcacoche)
values('01', '01', 'Audi');
insert into MarcosSalafranca.marca (idmarca, idgrupo, marcacoche)
values('02','01','Seat');

insert into MarcosSalafranca.marca (idmarca, idgrupo, marcacoche)
values('03', '02', 'BMW');
insert into MarcosSalafranca.marca (idmarca, idgrupo, marcacoche)
values('04','02','Mini');

insert into MarcosSalafranca.marca (idmarca, idgrupo, marcacoche)
values('05', '03', 'Opel');
insert into MarcosSalafranca.marca (idmarca, idgrupo, marcacoche)
values('06','03','Peugot');
insert into MarcosSalafranca.marca (idmarca, idgrupo, marcacoche)
values('07','03','Fiat');

insert into MarcosSalafranca.marca (idmarca, idgrupo, marcacoche)
values('08', '04', 'Dacia');
insert into MarcosSalafranca.marca (idmarca, idgrupo, marcacoche)
values('09','04','Nissan');
insert into MarcosSalafranca.marca (idmarca, idgrupo, marcacoche)
values('10','04','Renault');



--Insert Modelo
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('01', '01', 'A3');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('02','01','A5');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('03', '02', 'Ibiza');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('04','02','Leon');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('05', '03', 'Serie3');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('06','03','Serie5');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('07', '04', 'Mini');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('08','05','Corsa');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('09','05','Astra');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('11','06','3008');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('12','06','2008');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('13','07','Tipo');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('14','07','Panda');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('15','08','Sandero');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('16','08','Duster');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('17','09','Micra');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('18','09','Terrano');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('19','10','Twingo');
insert into MarcosSalafranca.modelo (idmodelo, idmarca, modelocoche)
values('20','10','Clio');

--insert Color
insert into MarcosSalafranca.color (idcolor, color)
values('01','Rojo');
insert into MarcosSalafranca.color (idcolor, color)
values('02','Negro');
insert into MarcosSalafranca.color (idcolor, color)
values('03','Blanco');
insert into MarcosSalafranca.color (idcolor, color)
values('04','Gris');
insert into MarcosSalafranca.color (idcolor, color)
values('05','Amarillo');

--Insert Seguro
insert into MarcosSalafranca.seguro (idseguro, nombreseguro)
values('01','Mapfre');
insert into MarcosSalafranca.seguro (idseguro, nombreseguro)
values('02','Axa');
insert into MarcosSalafranca.seguro (idseguro, nombreseguro)
values('03','Genesis');
insert into MarcosSalafranca.seguro (idseguro, nombreseguro)
values('04','LineaDirecta');

--Insert TipoMoneda
insert into MarcosSalafranca.tipomoneda  (idmoneda, nombremoneda)
values('01','EUR');
insert into MarcosSalafranca.tipomoneda  (idmoneda, nombremoneda)
values('02','USD');
insert into MarcosSalafranca.tipomoneda  (idmoneda, nombremoneda)
values('03','GBP');


--Insert coche
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro,  matricula, km, numeroseguro )
values('01','2019-11-01','01','01','01','7498DJL','10100','240890');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro,  matricula, km, numeroseguro )
values('02','2018-01-01','02','05','02','4567IYR','90100','123456');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro,  matricula, km, numeroseguro )
values('03','2020-04-01','04','04','01','78961QER','101100','798645');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro, matricula, km, numeroseguro, fechaventa )
values('04','2019-03-01','06','04','02','1427WER','10240','316497', '2023-01-01');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro,  matricula, km, numeroseguro, fechaventa )
values('05','2019-04-01','01','02','03','3468UOP','14000','145789','2023-01-01');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro,  matricula, km, numeroseguro )
values('06','2018-11-01','01','02','03','9800HJL','22100','644579');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro, matricula, km, numeroseguro )
values('07','2019-04-01','07','01','01','0093PLO','20450','665789');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro,  matricula, km, numeroseguro )
values('08','2021-11-01','01','02','02','9283PLO','10180','2345789');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro,  matricula, km, numeroseguro )
values('09','2018-11-01','09','01','01','9945BFR','11100','441257');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro,  matricula, km, numeroseguro, fechaventa )
values('10','2021-08-01','01','01','03','1234AAA','102170','457896','2022-12-01');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro,  matricula, km, numeroseguro )
values('11','2019-11-01','09','03','01','1111BFG','42170','556876');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro,  matricula, km, numeroseguro )
values('12','2019-08-01','01','01','01','6767LPO','101100','976453');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro, matricula, km, numeroseguro )
values('13','2021-11-01','01','01','04','3412RTY','10300','124579');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro,  matricula, km, numeroseguro )
values('14','2019-07-01','11','03','04','2443CVB','10508','445678');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro,  matricula, km, numeroseguro )
values('15','2022-11-01','20','01','01','9800KLP','40170','234798');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro,  matricula, km, numeroseguro, fechaventa )
values('16','2022-07-01','01','01','01','3345MTR','11230','423698','2023-01-01');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro,  matricula, km, numeroseguro )
values('17','2019-11-01','06','01','02','7866GJU','23170','998785');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro,  matricula, km, numeroseguro )
values('18','2019-08-01','01','04','01','7498DOL','10230','65731');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro, matricula, km, numeroseguro )
values('19','2020-11-01','09','04','04','3409MCP','80789','134597');
insert into MarcosSalafranca.coche  (idcoche, fechacompra, idmodelo, idcolor, idseguro,  matricula, km, numeroseguro )
values('20','2020-10-01','11','01','04','5749BRS','10045','654798');


--Insert Revison
insert into MarcosSalafranca.revision  (idrevision, idmoneda, km, importe)
values('01',  '01', '10000', '240');
insert into MarcosSalafranca.revision  (idrevision, idmoneda, km, importe)
values('02', '01', '20000', '170');
insert into MarcosSalafranca.revision (idrevision, idmoneda, km, importe)
values('03',  '01', '40000', '460');
insert into MarcosSalafranca.revision (idrevision, idmoneda, km, importe)
values('04', '01',' 80000', '800');
insert into MarcosSalafranca.revision  (idrevision, idmoneda, km, importe)
values('05',  '01', '100000', '520');
insert into MarcosSalafranca.revision  (idrevision, idmoneda, km, importe)
values('06',  '02',' 10000', '240');
insert into MarcosSalafranca.revision  (idrevision, idmoneda, km, importe)
values('07',  '02', '20000', '170');
insert into MarcosSalafranca.revision  (idrevision, idmoneda, km, importe)
values('08', '02', '40000', '460');
insert into MarcosSalafranca.revision  (idrevision, idmoneda, km, importe)
values('09', '03', '20000', '400');
insert into MarcosSalafranca.revision  (idrevision, idmoneda, km, importe)
values('10', '03', '100000',' 500');


--Insert Revison
insert into MarcosSalafranca.revisioncoche  (idnumerorevision, idrevision, idcoche, fecharevision)
values('01', '01', '01',' 2020-01-01');
insert into MarcosSalafranca.revisioncoche  (idnumerorevision, idrevision, idcoche, fecharevision)
values('02', '02', '02',' 2020-01-01');
insert into MarcosSalafranca.revisioncoche  (idnumerorevision, idrevision, idcoche, fecharevision)
values('03', '03', '02',' 2021-05-01');
insert into MarcosSalafranca.revisioncoche  (idnumerorevision, idrevision, idcoche, fecharevision)
values('04', '05', '12',' 2022-01-01');
insert into MarcosSalafranca.revisioncoche  (idnumerorevision, idrevision, idcoche, fecharevision)
values('05', '08', '11',' 2022-01-07');




