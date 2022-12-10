
-- Antes de ejecutar asegurese de insertar su rol --

     
 -- Role: nruocnba
-- DROP ROLE IF EXISTS nruocnba;

--CREATE ROLE nruocnba WITH
 -- LOGIN
  --SUPERUSER
  --INHERIT
  --CREATEDB
 -- CREATEROLE
 -- REPLICATION;
   
 -- Database: nruocnba

-- DROP DATABASE IF EXISTS nruocnba;

--CREATE DATABASE nruocnba
   -- WITH
   -- OWNER = nruocnba
    --ENCODING = 'UTF8'
    --LC_COLLATE = 'Spanish_Spain.1252'
    --LC_CTYPE = 'Spanish_Spain.1252'
   -- TABLESPACE = pg_default
   -- CONNECTION LIMIT = -1
   -- IS_TEMPLATE = False;





 --**************************************************************************
   
create schema giulianascoppettone authorization nruocnba;


-- creamos las tablas



--GRUPO--
create table giulianascoppettone.grupo_marca(
	idgrupo_marca varchar(20) not null, -- PK 
	name varchar(50) not null,
	description varchar (100) null
	);

alter table giulianascoppettone.grupo_marca
add constraint id_grupo_marca primary key (idgrupo_marca);





--MARCA..
create table giulianascoppettone.marca(
	idmarca varchar(50) not null,
	name varchar(50) not null,
	description varchar(100) null
	);

alter table giulianascoppettone.marca
add constraint id_marca primary key (idmarca);


alter table giulianascoppettone.marca
add column idgrupo varchar(10) null;





--MODELO--
create table giulianascoppettone.modelo(
	idmodelo varchar(10) not null,
	name varchar(20) not null,
	description varchar(50) null 
	);

alter table giulianascoppettone.modelo
add constraint id_modelo primary key (idmodelo);


alter table giulianascoppettone.modelo
add column idgrupo varchar(10) null,
add column idmarca varchar(10) null;




--COMPANY--
create table giulianascoppettone.compania_seguro(
	idcompany varchar(20) not null, 
	name varchar(50) not null,
	description varchar(50) null
	);

alter table giulianascoppettone.compania_seguro
add constraint id_company primary key (idcompany);




--POLIZA--
create table giulianascoppettone.poliza(
	idpoliza varchar(10) not null,
	name varchar(20) not null,
	description varchar (50) null
	);


alter table giulianascoppettone.poliza
add constraint id_poliza primary key (idpoliza);



--COLOR--
create table giulianascoppettone.color(
	idcolor varchar(10) not null,
	name varchar (20) not null, 
	description varchar(50) not null
	);

alter table giulianascoppettone.color
add constraint id_color primary key (idcolor);





---vehicle---

create table giulianascoppettone.vehicle(
	idvehicle varchar(20) not null, --PK 
	fecha_compra date not null,
	matricula varchar(20) not null,
	kilometros integer not null, 
	--ahora las FK--
	idgrupo_marca varchar(20) not null,
	idmarca varchar(20) not null, 
	idmodelo varchar(10) not null,
	idcompany varchar(20) not null,
	idpoliza varchar(10) not null,
	idcolor varchar(10) not null
	);



alter table giulianascoppettone.vehicle
add constraint id_vehicle primary key (idvehicle);

alter table giulianascoppettone.vehicle
add constraint idgrupo_marca_FK foreign key (idgrupo_marca)
references giulianascoppettone.grupo_marca(idgrupo_marca); 


alter table giulianascoppettone.vehicle
add constraint idmarca_FK foreign key (idmarca)
references giulianascoppettone.marca(idmarca);
				

alter table giulianascoppettone.vehicle
add constraint idmodelo_FK foreign key (idmodelo)
references giulianascoppettone.modelo(idmodelo);


alter table giulianascoppettone.vehicle
add constraint idcompany_FK foreign key (idcompany)
references giulianascoppettone.compania_seguro(idcompany);


alter table giulianascoppettone.vehicle
add constraint idpoliza_FK foreign key (idpoliza)
references giulianascoppettone.poliza(idpoliza);

alter table giulianascoppettone.vehicle
add constraint idcolor_FK foreign key (idcolor)
references giulianascoppettone.color(idcolor);






--Currency--


create table giulianascoppettone.currency(
	idcurrency varchar(20) not null,
	name varchar(20)not null
	);

alter table giulianascoppettone.currency
add constraint id_currency primary key (idcurrency);



--Revisiones--


create table giulianascoppettone.revisiones(
	idrevisiones varchar(10) not null, --PK
	idvehicle varchar(20) not null, --FK
	fecha_revision date not null, 
	importe int not null, 
	idcurrency varchar(20) not null
	);


alter table giulianascoppettone.revisiones
add constraint id_revisiones primary key (idrevisiones);

alter table giulianascoppettone.revisiones 
add constraint idvehicle_FK foreign key (idvehicle)
references giulianascoppettone.vehicle(idvehicle);

alter table giulianascoppettone.revisiones
add constraint idcurrency_FK foreign key (idcurrency)
references giulianascoppettone.currency(idcurrency);



-- **agregamos los datos**



--TABLAS GRUPO DE MARCA EMPRESARIAL 

insert into giulianascoppettone.grupo_marca 
(idgrupo_marca, name, description)
values ('001', 'VAG', '');

insert into giulianascoppettone.grupo_marca 
(idgrupo_marca, name, description)
values ('002', 'ToyotaMotor', '');

insert into giulianascoppettone.grupo_marca 
(idgrupo_marca, name, description)
values ('003', 'Stellantis', '');


--TABLAS MARCA por grupo

--VAG
insert into giulianascoppettone.marca
(idmarca, name, description)
values ('1001', 'Audi', '');

insert into giulianascoppettone.marca
(idmarca, name, description)
values ('1002', 'Bentley', '');

insert into giulianascoppettone.marca
(idmarca, name, description)
values ('1003', 'Skoda', '');


--ToyotaMotors
insert into giulianascoppettone.marca
(idmarca, name, description)
values ('1009', 'Toyota', '');

insert into giulianascoppettone.marca
(idmarca, name, description)
values ('1010', 'Lexus', '');

insert into giulianascoppettone.marca
(idmarca, name, description)
values ('1011', 'Daihatsu', '');


--Stellantis
insert into giulianascoppettone.marca
(idmarca, name, description)
values ('1013', 'Alfa Romeo', '');

insert into giulianascoppettone.marca
(idmarca, name, description)
values ('1014', 'Fiat', '');

insert into giulianascoppettone.marca
(idmarca, name, description)
values ('1015', 'Lancia', '');

---TABLAS MODELOS por marca

--GRUPO VAG -- AUDI
insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1111', 'A4', '');

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1112', 'A4 Avant', '');

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1113', 'A1 Sport', '');

--GRUPO VAG -- Bentley
insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1114', 'Bentayga', '');

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1115', 'Continental GT', '');

--GRUPO VAG -- Skoda
insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1116', 'Fabia', '');

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1117', 'Fabia Monte Carlo', '');

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1118', 'Kamiq', '');

--GRUPO TOYOTAmotor - Toyota

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1119', 'Yaris', '');

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1120', 'Corolla', '');

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1121', 'Camry', '');

--Grupo ToyotaMotor - Lexus

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1122', 'ES', '');

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1123', 'NX', '');

--Grupo Toyota Motors -- Daihatsu

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1124', 'Rocky', '');

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1125', 'Terios', '');

--Grupo Sellantis -- Alfa Romeo

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1126', 'Giulia', '');

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1127', 'Giulietta', '');

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1128', 'Stelvio', '');

--Grupo Stellantis -- Fiat

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1129', 'F500', '');

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1130', 'Panda', '');


--Grupo Stellantis - Lancia

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1131', 'Delta', '');

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1132', 'Ypsilon', '');

insert into giulianascoppettone.modelo
(idmodelo, name, description)
values ('1133', 'Musa', '');


--Tabla Compania seguros

insert into giulianascoppettone.compania_seguro
(idcompany, name, description)
values ('33100', 'Mapfre','');

insert into giulianascoppettone.compania_seguro
(idcompany, name, description)
values ('33101', 'Allianz','');

insert into giulianascoppettone.compania_seguro
(idcompany, name, description)
values ('33102', 'Mutua Madrilena','');

insert into giulianascoppettone.compania_seguro
(idcompany, name, description)
values ('33103', 'AXA','');

insert into giulianascoppettone.compania_seguro
(idcompany, name, description)
values ('33104', 'DKV','');




--Tabla Poliza--

insert into giulianascoppettone.poliza
(idpoliza, name, description)
values ('P2578221', '','');

insert into giulianascoppettone.poliza
(idpoliza, name, description)
values ('P2578222', '','');

insert into giulianascoppettone.poliza
(idpoliza, name, description)
values ('P2578223', '','');

insert into giulianascoppettone.poliza
(idpoliza, name, description)
values ('P2578224', '','');

insert into giulianascoppettone.poliza
(idpoliza, name, description)
values ('P2578225', '','');

insert into giulianascoppettone.poliza
(idpoliza, name, description)
values ('P2578226', '','');

insert into giulianascoppettone.poliza
(idpoliza, name, description)
values ('P2578227', '','');

insert into giulianascoppettone.poliza
(idpoliza, name, description)
values ('P2578228', '','');

insert into giulianascoppettone.poliza
(idpoliza, name, description)
values ('P25782219', '','');


-- Tabla Color

insert into giulianascoppettone.color
(idcolor, name, description)
values ('C01', 'Blanco','');

insert into giulianascoppettone.color
(idcolor, name, description)
values ('C02', 'Negro','');

insert into giulianascoppettone.color
(idcolor, name, description)
values ('C03', 'Negro Opaco','');

insert into giulianascoppettone.color
(idcolor, name, description)
values ('C04', 'Beige','');

insert into giulianascoppettone.color
(idcolor, name, description)
values ('C05', 'Gris','');

insert into giulianascoppettone.color
(idcolor, name, description)
values ('C06', 'Rojo','');

insert into giulianascoppettone.color
(idcolor, name, description)
values ('C07', 'Azul','');

 

--Vehiculo--



-- Grupo VAG 001 --
insert into giulianascoppettone.vehicle 
(idvehicle, fecha_compra, matricula, kilometros, idgrupo_marca, idmarca, idmodelo, idcompany, idcolor, idpoliza)
values ('V1','01-01-2022','ABC123','100000', '001', '1001', '1111', '33100', 'C01', 'P2578221' );

insert into giulianascoppettone.vehicle 
(idvehicle, fecha_compra, matricula, kilometros, idgrupo_marca, idmarca, idmodelo, idcompany, idcolor, idpoliza)
values ('V2','10-01-2022','AAA123','120000', '001', '1002', '1114', '33101', 'C02', 'P2578222');

insert into giulianascoppettone.vehicle 
(idvehicle, fecha_compra, matricula, kilometros, idgrupo_marca, idmarca, idmodelo, idcompany, idcolor, idpoliza)
values ('V3','07-02-2022','BBB123','80000', '001', '1003', '1116', '33102', 'C03', 'P2578223');



--Grupo toyota motor 002 --
insert into giulianascoppettone.vehicle 
(idvehicle, fecha_compra, matricula, kilometros, idgrupo_marca, idmarca, idmodelo, idcompany, idcolor, idpoliza)
values ('V4','02-02-2022','CCC123','105000', '002', '1009', '1119', '33103', 'C04', 'P2578224');

insert into giulianascoppettone.vehicle 
(idvehicle, fecha_compra, matricula, kilometros, idgrupo_marca, idmarca, idmodelo, idcompany, idcolor, idpoliza)
values ('V5','03-03-2022','DDD123','102000', '002', '1010', '1122', '33104', 'C05', 'P2578225');

insert into giulianascoppettone.vehicle 
(idvehicle, fecha_compra, matricula, kilometros, idgrupo_marca, idmarca, idmodelo, idcompany, idcolor, idpoliza)
values ('V6','05-03-2022','DDD122','103000', '002', '1011', '1124', '33100', 'C06', 'P2578226');



--Grupo Stellantis 003--
insert into giulianascoppettone.vehicle 
(idvehicle, fecha_compra, matricula, kilometros, idgrupo_marca, idmarca, idmodelo, idcompany, idcolor, idpoliza)
values ('V7','03-03-2022','DDD124','112000', '003', '1013', '1126', '33102', 'C07', 'P2578227');

insert into giulianascoppettone.vehicle 
(idvehicle, fecha_compra, matricula, kilometros, idgrupo_marca, idmarca, idmodelo, idcompany, idcolor, idpoliza)
values ('V8','08-03-2022','DDD125','122000', '003', '1014', '1129', '33103', 'C01', 'P2578228');

insert into giulianascoppettone.vehicle 
(idvehicle, fecha_compra, matricula, kilometros, idgrupo_marca, idmarca, idmodelo, idcompany, idcolor, idpoliza)
values ('V9','01-05-2022','DDD126','108000', '003', '1015' , '1131', '33104', 'C02', 'P25782219');





--Datos tabla currency

insert into giulianascoppettone.currency 
(idcurrency, name)
values ('1', 'Euros')

insert into giulianascoppettone.currency
(idcurrency, name)
values ('2', 'Dolares')



--Datos tabla Revisiones

insert into giulianascoppettone.revisiones
(idrevisiones, idvehicle, fecha_revision, importe, idcurrency)
values ('R01', 'V1', '08-08-2022', '400', '1')

insert into giulianascoppettone.revisiones
(idrevisiones, idvehicle, fecha_revision, importe, idcurrency)
values ('R02', 'V1', '10-10-2022', '200', '1')

insert into giulianascoppettone.revisiones
(idrevisiones, idvehicle, fecha_revision, importe, idcurrency)
values ('R03', 'V5', '08-09-2022', '560', '1')

insert into giulianascoppettone.revisiones
(idrevisiones, idvehicle, fecha_revision, importe, idcurrency)
values ('R04', 'V8', '09-04-2022', '700', '1')

insert into giulianascoppettone.revisiones
(idrevisiones, idvehicle, fecha_revision, importe, idcurrency)
values ('R05', 'V9', '10-11-2022', '600', '1')

insert into giulianascoppettone.revisiones
(idrevisiones, idvehicle, fecha_revision, importe, idcurrency)
values ('R06', 'V6', '09-09-2022', '720', '1')




--QUERY DEL ENUNCIADO--


select 
		gm.name as Grupo_empresarial
		,m.name as Marca
		,m2.name as Modelo 
		,c.name as Color
		,v.matricula 
		,v.kilometros
		,cs.name as Compania_seguro
		,p.idpoliza as Numero_poliza
		,v.fecha_compra 
		,r.fecha_revision 
		,r.importe as Importe_revision
		,c2.name as Moneda
		from giulianascoppettone.vehicle v 
		inner join giulianascoppettone.grupo_marca gm on v.idgrupo_marca  = gm.idgrupo_marca 
		inner join giulianascoppettone.modelo m2 on v.idmodelo = m2.idmodelo 
		inner join giulianascoppettone.marca m on m.idmarca = v.idmarca 
		inner join giulianascoppettone.color c on v.idcolor = c.idcolor  
		inner join giulianascoppettone.compania_seguro cs on cs.idcompany = v.idcompany 
		inner join giulianascoppettone.poliza p on p.idpoliza = v.idpoliza 
		left join giulianascoppettone.revisiones r on v.idvehicle = r.idvehicle
		left join giulianascoppettone.currency c2 on r.idcurrency = c2.idcurrency 
