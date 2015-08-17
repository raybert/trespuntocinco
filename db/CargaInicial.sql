USE TresPuntoCinco
GO


DELETE FROM Cliente;
DELETE FROM Colaborador;
DELETE FROM Unidad;
DELETE FROM UnidadMedida;
DELETE FROM Ruta;
DELETE FROM Lugar;
DELETE FROM Empresa;

DELETE FROM Cliente;
DELETE FROM Colaborador;
DELETE FROM Unidad;
DELETE FROM Lugar;
DELETE FROM UnidadMedida;
DELETE FROM Ruta;
DELETE FROM TipoUnidad;


INSERT INTO Empresa ( RazonSocial )
			 VALUES ( 'Servicentro San Luis' ), 
					( '3.5 Logistica' );
GO

INSERT INTO TipoUnidad ( Tipo )
			 VALUES ( 'Ranfla' ), 
					( 'Tolva' ),
					( 'Camión' ),
					( 'Cisterna' );
GO

INSERT INTO Cliente ( NumeroRuc, RazonSocial, Direccion, Telefono, Url, Estado )
			 VALUES ( '20465465421', 'Adm Andina Peru', 'Av. Uno 111', '54654656', 'http://www.andina.com/', 'A' ), 
					( '10778442133', 'Agersa', 'Av. Dos 111', '65464536', 'http://www.agersa.com/', 'A' ), 
					( '20546889154', 'Austral Group', 'Av. Tres 333', '635346', 'http://www.austral.com/', 'A' ), 
					( '20318798798', 'Barcino', 'Av. Cuatro 444', '7685687678', 'http://www.barcino.com/', 'A' ), 
					( '20546849849', 'Ciclon', 'Av. Cinco 555', '1234412345', 'http://www.ciclon.com/', 'A' ), 
					( '10546898798', 'Food Market', 'Av. Seis 666', '6577686556', 'http://www.food-market.com/', 'A' ), 
					( '10654987213', 'GT Transportes', 'Av. Siete 777', '87686758', 'http://www.gt-transportes.com/', 'A' ), 
					( '20654987123', 'MC Transportes', 'Av. Ocho 888', '768756', 'http://www.mc-transp.com/', 'A' ), 
					( '10784599546', 'Raciemsa', 'Av. Nueve 999', '5785756', 'http://www.raciemsa.com/', 'A' ), 
					( '10498789789', 'Repsol', 'Av. Diez 1010', '5678569', 'http://www.repsol.com/', 'A' ), 
					( '20548987989', 'RJ Transervis', 'Av. Once 1111', '078907890897', 'http://www.transervis.com/', 'A' ), 
					( '10549879876', 'Rodriguez Pizarro', 'Av. Doce 1212', '08977090', 'http://www.rodriguez.com/', 'A' ), 
					( '20549687983', 'San Luis', 'Av. Trece 1313', '8678568', 'http://www.sanlius.com/', 'A' ), 
					( '46548649999', 'Scharff', 'Av. Catorce 1414', '5744567564', 'http://www.scharff.com/', 'A' ), 
					( '20549879876', 'Sea Land', 'Av. Quince 1515', '74654', 'http://www.sealand.com/', 'A' ), 
					( '97897454654', 'Consorcio Constructora Tramo 4', 'Av. Dieciseis 1616', '768789789', 'http://www.tramocuatro.com/', 'A' ), 
					( '65468498799', 'Hudbay Peru S.A.C. Mina Constancia', 'Av. Diecisiete 1717', '36565356', 'http://www.Hudbay.com/', 'A' );
GO

INSERT INTO Colaborador ( Nombre, Apellidos, Domicilio, Documento, Telefono, NumeroBrevete, TipoBrevete, Estado )
				 VALUES ( 'Omar', 'Tejada Cahui', 'Calle Uno 23', 29645465, '87987899', 'A54654', 'A-III', 'A'),
						( 'Fredy', 'Aranibar Valencia', 'Av. Siempre Viva 123', 29654546, '423235234', '32423FGF', 'A-III', 'A'),
						( 'Cesar', 'Alvarez Pinto', 'Av. Siempre Viva 123', 29654546, '423235234', '32423FGF', 'A-III', 'A'),
						( 'Nestor', 'Vilca Pinto', 'Av. Siempre Viva 123', 29654546, '423235234', '32423FGF', 'A-III', 'A'),
						( 'Jesus', 'Quispe Villafuerte', 'Av. Siempre Viva 123', 29654546, '423235234', '32423FGF', 'A-III', 'A'),
						( 'Robert', 'Loaiza Chavez', 'Av. Siempre Viva 123', 29654546, '423235234', '32423FGF', 'A-III', 'A'),
						( 'Enrique', 'Chavez Carbajal', 'Av. Siempre Viva 123', 29654546, '423235234', '32423FGF', 'A-III', 'A'),
						( 'Milwar', 'Hernani Crespo', 'Av. Las Condes 112', 40005486, '4324324', '14324SSA', 'A-III', 'A');
GO


CREATE TABLE Unidad
(
	IdUnidad INTEGER IDENTITY(1, 1) NOT NULL,
	Empresa INTEGER NOT NULL,
	Placa VARCHAR(10) NOT NULL,
	Capacidad INTEGER NOT NULL,
	IdTipoUnidad INTEGER NOT NULL,
	RazonSocial VARCHAR(500),
	IdUnidadMedida INTEGER NOT NULL,
	Marca VARCHAR(100) NOT NULL,
	Modelo VARCHAR(100) NOT NULL
)
GO


INSERT INTO Unidad ( Placa, Capacidad, Empresa, Modelo, IdTipoUnidad, IdUnidadMedida, Marca )
			VALUES ( 'V4-U835', 1000, 1, '', 3, 1, 'Volvo' ),
				   ( 'V1-Y934', 2000, 2, '', 3, 1, 'Volvo' ),
				   ( 'V3-U828', 3000, 1, '', 3, 1, 'Volvo' ),
				   ( 'V3-Z779', 4000, 1, '', 3, 1, 'Volvo' ),
				   ( 'V4-A700', 5000, 1, '', 3, 1, 'Volvo' ),
				   ( 'V3-K743', 6000, 1, '', 3, 1, 'Volvo' ),
				   ( 'V2-X742', 7000, 2, '', 3, 1, 'Volvo' ),
				   ( 'V1-S844', 8000, 1, '', 3, 1, 'Volvo' );
GO

INSERT INTO Lugar ( NombreLugar, NombreCorto )
		   VALUES ( 'Arequipa', 'AQP' ),
				  ( 'Corire', 'COR' ),
				  ( 'Desaguadero', 'DES' ),
				  ( 'Lima', 'LIM' ),
				  ( 'Matarani', 'MAT' ),
				  ( 'Mollendo', 'MLL' ),
				  ( 'Pisco', 'PIS' ),
				  ( 'San Jose', 'SJ' ),
				  ( 'Tacna', 'TAC' ),
				  ( 'Juliaca', 'JUL' ),
				  ( 'Puno', 'PUN' ),
				  ( 'Cusco', 'CUS' ),
				  ( 'Callao', 'CAL' ),
				  ( 'Siguas', 'SIG' );;
GO

INSERT INTO UnidadMedida ( Medida, NombreCorto )
				  VALUES ( 'Tonelada', 'Tn' ),
						 ( 'Galones', 'Gl'),	
						 ( 'Contenedor', 'Ct');
GO


INSERT INTO Ruta ( Origen, Destino, NombreRuta, NombreCorto, TiempoViaje, Kilometraje )
		  VALUES ( 6, 1, 'Mollendo - Arequipa', 'MLL-AQP', 0, 250 ),
				 ( 7, 1, 'Pisco - Arequipa', 'PIS-AQP', 0, 1590 ),
				 ( 10, 1, 'Juliaca - Arequipa', 'JUL-AQP', 0, 560 ),
				 ( 3, 13, 'Desaguadero - Callao', 'DES-CAL', 0, 1768 ),
				 ( 13, 1, 'Callao - Arequipa', 'CAL-AQP', 0, 1050 ),
				 ( 5, 8, 'Matarani - San Jose', 'MAT-SJ', 0, 123 ),
				 ( 5, 1, 'Matarani - Arequipa', 'MAT-AQP', 0, 230 ),
				 ( 3, 1, 'Desaguadero - Arequipa', 'DES-AQP', 0, 422 );
GO				 




