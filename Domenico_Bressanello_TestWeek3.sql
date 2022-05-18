create database DaLuigi;

CREATE TABLE Pizza(
	IdPizza Int Identity (1,1),
	Nome varchar(30) not null,
	Prezzo decimal(4,2) not null
	CONSTRAINT PK_PIZZA PRIMARY KEY (IdPizza),
	CONSTRAINT UQ_PIZZA UNIQUE (Nome),
	CHECK (Prezzo > 0)
)


CREATE TABLE Ingrediente(
	IdIngrediente Int Identity (1,1),
	Nome varchar(30) not null,
	Costo decimal(4,2) not null,
	ScortaMagazzino int not null
	CONSTRAINT PK_INGREDIENTE PRIMARY KEY (IdIngrediente),
	CONSTRAINT UQ_INGREDIENTE UNIQUE (Nome),
	CHECK(Costo > 0 ),
	CHECK(ScortaMagazzino >= 0)
)

CREATE TABLE PizzaIngrediente(
	IdPizza Int NOT NULL,
	IdIngrediente Int NOT NULL,
	CONSTRAINT FK_PIZZA FOREIGN KEY (IdPizza)REFERENCES Pizza(IdPizza),
	CONSTRAINT FK_INGREDIENTE FOREIGN KEY (IdIngrediente)REFERENCES Ingrediente(IdIngrediente),
	CONSTRAINT PK_PizzaIngrediente Primary Key (IdPizza, IdIngrediente)
)

--insert Pizze
INSERT INTO Pizza VALUES ('Margherita', 5.00);
INSERT INTO Pizza VALUES ('Bufala', 7.00);
INSERT INTO Pizza VALUES ('Diavola', 6.00);
INSERT INTO Pizza VALUES ('Quattro stagioni', 6.50);
INSERT INTO Pizza VALUES ('Porcini', 7.0);
INSERT INTO Pizza VALUES ('Dioniso', 8.0);
INSERT INTO Pizza VALUES ('Ortolana', 8.0);
INSERT INTO Pizza VALUES ('Patate e salsiccia', 6.0);
INSERT INTO Pizza VALUES ('Pomodorini', 6.0);
INSERT INTO Pizza VALUES ('Quattro Formaggi', 7.50);
INSERT INTO Pizza VALUES ('Caprese', 7.50);
INSERT INTO Pizza VALUES ('Zeus', 7.50);

--insert Ingredienti
INSERT INTO Ingrediente VALUES ('Pomodoro', 0.5, 10)
INSERT INTO Ingrediente VALUES ('Mozzarella', 1.00, 10)
INSERT INTO Ingrediente VALUES ('Spianata Piccante', 1.5, 10)
INSERT INTO Ingrediente VALUES ('Funghi', 0.5, 10)
INSERT INTO Ingrediente VALUES ('Carciofi', 1.00, 10)
INSERT INTO Ingrediente VALUES ('Cotto', 0.5, 10)
INSERT INTO Ingrediente VALUES ('Olive', 0.5, 10)
INSERT INTO Ingrediente VALUES ('Funghi Porcini', 2.00, 10)
INSERT INTO Ingrediente VALUES ('Stracchino', 0.5, 10)
INSERT INTO Ingrediente VALUES ('Speck', 1.5, 10)
INSERT INTO Ingrediente VALUES ('Rucola', 0.5, 10)
INSERT INTO Ingrediente VALUES ('Grana', 2.00, 10)
INSERT INTO Ingrediente VALUES ('Verdure di stagione', 0.5, 10)
INSERT INTO Ingrediente VALUES ('Patate', 0.5, 10)
INSERT INTO Ingrediente VALUES ('Salsiccia', 0.5, 10)
INSERT INTO Ingrediente VALUES ('Pomodorini', 0.5, 10)
INSERT INTO Ingrediente VALUES ('Ricotta', 0.5, 10)
INSERT INTO Ingrediente VALUES ('Provola', 1.00, 10)
INSERT INTO Ingrediente VALUES ('Gorgonzola', 1.00, 10)
INSERT INTO Ingrediente VALUES ('Pomodoro fresco', 0.5, 10)
INSERT INTO Ingrediente VALUES ('Basilico', 0.5, 10)
INSERT INTO Ingrediente VALUES ('Bresaola', 2.00, 10)
INSERT INTO Ingrediente VALUES ('Mozzarella di bufala', 1.00, 10)
select * from Ingrediente

--Insert Composizioni Pizze. Uso la stored Procedure AssegnazioneIngrediente

--margherita
--INSERT into PizzaIngrediente values (1, 1)
--INSERT into PizzaIngrediente values (1, 2)

EXECUTE AssegnaIngrediente 'Margherita', 'Pomodoro'
EXECUTE AssegnaIngrediente 'Margherita', 'Mozzarella'

--bufala
EXECUTE AssegnaIngrediente 'Bufala', 'Pomodoro'
EXECUTE AssegnaIngrediente 'Bufala', 'Mozzarella di Bufala'

--diavola
EXECUTE AssegnaIngrediente 'Diavola', 'Pomodoro'
EXECUTE AssegnaIngrediente 'Diavola', 'Mozzarella'
EXECUTE AssegnaIngrediente 'Diavola', 'Spianata piccante'

--4 stagioni
EXECUTE AssegnaIngrediente 'Quattro Stagioni', 'Pomodoro'
EXECUTE AssegnaIngrediente 'Quattro Stagioni', 'Mozzarella'
EXECUTE AssegnaIngrediente 'Quattro Stagioni', 'Funghi'
EXECUTE AssegnaIngrediente 'Quattro Stagioni', 'Cotto'
EXECUTE AssegnaIngrediente 'Quattro Stagioni', 'Olive'
EXECUTE AssegnaIngrediente 'Quattro Stagioni', 'Carciofi'

--Porcini
EXECUTE AssegnaIngrediente 'Porcini', 'Pomodoro'
EXECUTE AssegnaIngrediente 'Porcini', 'Mozzarella'
EXECUTE AssegnaIngrediente 'Porcini', 'Funghi porcini'


--Dioniso
EXECUTE AssegnaIngrediente 'Dioniso', 'Pomodoro'
EXECUTE AssegnaIngrediente 'Dioniso', 'Mozzarella'
EXECUTE AssegnaIngrediente 'Dioniso', 'Stracchino'
EXECUTE AssegnaIngrediente 'Dioniso', 'Speck'
EXECUTE AssegnaIngrediente 'Dioniso', 'Rucola'
EXECUTE AssegnaIngrediente 'Dioniso', 'Grana'

--Ortolana
EXECUTE AssegnaIngrediente 'Ortolana', 'Pomodoro'
EXECUTE AssegnaIngrediente 'Ortolana', 'Mozzarella'
EXECUTE AssegnaIngrediente 'Ortolana', 'Verdure di stagione'

--Patate e Salsiccia
EXECUTE AssegnaIngrediente 'Patate e Salsiccia', 'Mozzarella'
EXECUTE AssegnaIngrediente 'Patate e Salsiccia', 'Patate'
EXECUTE AssegnaIngrediente 'Patate e Salsiccia', 'Salsiccia'

--Pomodorini
EXECUTE AssegnaIngrediente 'Pomodorini', 'Pomodorini'
EXECUTE AssegnaIngrediente 'Pomodorini', 'Mozzarella'
EXECUTE AssegnaIngrediente 'Pomodorini', 'Ricotta'


--4 Formaggi
EXECUTE AssegnaIngrediente 'Quattro formaggi', 'provola'
EXECUTE AssegnaIngrediente 'Quattro formaggi', 'Mozzarella'
EXECUTE AssegnaIngrediente 'Quattro formaggi', 'grana'
EXECUTE AssegnaIngrediente 'Quattro formaggi', 'gorgonzola'

--Caprese
EXECUTE AssegnaIngrediente 'Caprese', 'Pomodoro fresco'
EXECUTE AssegnaIngrediente 'Caprese', 'Mozzarella'
EXECUTE AssegnaIngrediente 'Caprese', 'basilico'

--Zeus
EXECUTE AssegnaIngrediente 'Zeus', 'Rucola'
EXECUTE AssegnaIngrediente 'Zeus', 'Mozzarella'
EXECUTE AssegnaIngrediente 'Zeus', 'Bresaola'



--Query
--1. Estrarre tutte le pizze con prezzo superiore a 6 euro.
select distinct p.*
from Pizza p 
where p.Prezzo>6;

--2. Estrarre la pizza/le pizze più costosa/e. 
SELECT *
from Pizza p 
WHERE p.IdPizza in (select IdPizza
						from Pizza
						where Prezzo =(select max(Prezzo) from Pizza))
--oppure
SELECT Nome as [Pizza], Prezzo FROM Pizza
WHERE Prezzo=(select max(Prezzo) FROM Pizza)

--3.Estrarre le pizze «bianche», ovvero quelle che non contengono l'ingrediente "Pomodoro"
select distinct p.*
from Pizza p 
where p.Nome not in (
SELECT p.Nome 
from Pizza p join PizzaIngrediente c on p.IdPizza=c.IdPizza
join Ingrediente i on i.IdIngrediente=c.IdIngrediente
WHERE i.Nome = 'Pomodoro')


--4. Estrarre le pizze che contengono funghi (di qualsiasi tipo).
select distinct p.*
from Pizza p join PizzaIngrediente c on p.IdPizza=c.IdPizza
join Ingrediente i on i.IdIngrediente=c.IdIngrediente
where i.Nome like '%funghi%';




--Stored Procedure
--1. Inserimento Pizza
CREATE PROCEDURE InserimentoPizza @Nome varchar(30), @Prezzo decimal(4,2)
AS
BEGIN
INSERT INTO Pizza VALUES (@Nome, @Prezzo)
END

SELECT * FROM Pizza


--2. Assegna Ingrediente alla Pizza
CREATE PROCEDURE AssegnaIngrediente @NomePizza varchar(30), @NomeIngrediente varchar(30)
AS
BEGIN
declare @ID_Pizza int
declare @ID_Ingrediente int

select @ID_Pizza= IdPizza 
from Pizza 
where Nome=@NomePizza

select @ID_Ingrediente= IdIngrediente 
from Ingrediente 
where Nome=@NomeIngrediente

INSERT INTO PizzaIngrediente VALUES (@ID_Pizza, @ID_Ingrediente)
END


--3.Aggiornamento del prezzo di una pizza (parametri: nome pizza e nuovo prezzo)
CREATE PROCEDURE ModificaPrezzo @NomePizza varchar(30),@nuovoPrezzo decimal(4,2)
AS 
BEGIN
declare @ID_Pizza int
select @ID_Pizza= IdPizza 
from Pizza 
where Nome=@NomePizza

update PIZZA set Prezzo = @nuovoPrezzo WHERE IdPizza = @ID_Pizza;

END

--4.Eliminazione di un ingrediente da una pizza (parametri: nome pizza, nome ingrediente) 
CREATE PROCEDURE EliminaIngrediente @NomePizza varchar(30), @NomeIngrediente varchar(30)
AS
BEGIN
declare @ID_Pizza int
declare @ID_Ingrediente int

select @ID_Pizza= IdPizza 
from Pizza 
where Nome=@NomePizza

select @ID_Ingrediente= IdIngrediente 
from Ingrediente 
where Nome=@NomeIngrediente

DELETE FROM PizzaIngrediente WHERE IdPizza = @ID_Pizza AND IdIngrediente = @ID_Ingrediente
END


--5.Incremento del 10% del prezzo delle pizze contenenti un ingrediente (parametro: nome ingrediente) 
CREATE PROCEDURE IncrementaPrezzo @NomeIngrediente varchar(30)
AS 
BEGIN
declare @ID_Ingrediente int

select @ID_Ingrediente= IdIngrediente 
from Ingrediente 
where Nome=@NomeIngrediente

update PIZZA set Prezzo = Prezzo + (Prezzo*10)/100 WHERE IdPizza in (
SELECT p.IdPizza
from pizza p join PizzaIngrediente c on p.IdPizza = c.IdPizza
where c.IdIngrediente = @ID_Ingrediente)

END



--Funzioni
--1.Tabella listino pizze (nome, prezzo) (parametri: nessuno) 
CREATE FUNCTION ListinoPizze()
RETURNS TABLE
AS
RETURN 
SELECT p.Nome, p.Prezzo
from pizza p

select * from dbo.ListinoPizze()
order by Nome

--2 Tabella listino pizze (nome, prezzo) contenenti un ingrediente (parametri: nome ingrediente) 
CREATE FUNCTION ListinoPizzeConIngrediente(@NomeIngrediente varchar(30))
RETURNS TABLE
As
RETURN
SELECT p.Nome, p.Prezzo
from pizza p JOIN PizzaIngrediente c on p.IdPizza = c.IdPizza 
Where c.IdIngrediente  =  (select IdIngrediente from Ingrediente where Nome=@NomeIngrediente)


--oppure
CREATE FUNCTION ListinoPizzeConIngredienteProva2 (  
@NomeIngrediente varchar(30)
)
RETURNS @TabellaRisultato TABLE 
(
    NomePizza varchar(50),
	PrezzoPizza decimal (4,2)
)
AS
BEGIN
    DECLARE @ID_INGREDIENTE int;
    select @ID_INGREDIENTE=IdIngrediente from Ingrediente where Nome=@NomeIngrediente

    Insert into @TabellaRisultato
    SELECT p.Nome,p.Prezzo
	from pizza p JOIN PizzaIngrediente c on p.IdPizza = c.IdPizza 
	Where c.IdIngrediente  =  @ID_INGREDIENTE
  RETURN; 
END


select * from ListinoPizzeConIngredienteProva2 ('Mozzarella')


--3.Tabella listino pizze (nome, prezzo) che non contengono un certo ingrediente (parametri: nome ingrediente) 
CREATE FUNCTION ListinoPizzeSenzaIngrediente(@NomeIngrediente varchar(30))
RETURNS TABLE
AS
RETURN 
SELECT p.Nome, p.Prezzo
from pizza p
WHERE p.IdPizza 
not in (
select pizza.IdPizza
from pizza as pizza JOIN PizzaIngrediente c on pizza.IdPizza = c.IdPizza 
Where c.IdIngrediente = (select IdIngrediente 
						 from Ingrediente 
						 where Nome=@NomeIngrediente))

select * from ListinoPizzeSenzaIngrediente('Ricotta')

--4. Calcolo numero pizze contenenti un ingrediente (parametri: nome ingrediente) 
CREATE FUNCTION NumeroPizzeIngrediente(@NomeIngrediente varchar(30))
RETURNS INT
AS
BEGIN
declare @ID_Ingrediente int
select @ID_Ingrediente= IdIngrediente 
from Ingrediente 
where Nome=@NomeIngrediente

DECLARE @result int
SELECT @result = count(*)
FROM Ingrediente as I JOIN PizzaIngrediente as c ON i.IdIngrediente = c.IdIngrediente
WHERE i.IdIngrediente = @ID_Ingrediente
RETURN @result
END

select dbo.NumeroPizzeIngrediente('Pomodoro') as [Pizze con Pomodoro]


--5.Calcolo numero pizze che non contengono un ingrediente (parametri: codice ingrediente) 
CREATE FUNCTION NumeroPizzeNonContengonoIngrediente(@NomeIngrediente varchar(30))
RETURNS INT
AS
BEGIN
declare @ID_Ingrediente int
select @ID_Ingrediente= IdIngrediente 
from Ingrediente 
where Nome=@NomeIngrediente

DECLARE @result int

SELECT @result = count(IdPizza)
from Pizza where IdPizza not in 
(select p.IdPizza
FROM Pizza p JOIN PizzaIngrediente as c ON p.IdPizza = c.IdPizza
			 JOIN Ingrediente i on i.IdIngrediente = c.IdIngrediente
WHERE i.IdIngrediente = @ID_Ingrediente)

RETURN @result
END

select dbo.NumeroPizzeNonContengonoIngrediente('Grana')

--6. Calcolo numero ingredienti contenuti in una pizza (parametri: nome pizza)
CREATE FUNCTION NumeroIngredientiPizza(@NomePizza varchar(30))
RETURNS INT
AS
BEGIN
DECLARE @IdPizza int
select @IdPizza= IdPizza 
from Pizza 
where Nome=@NomePizza

DECLARE @result int
SELECT @result = count(*)
FROM Pizza as p JOIN PizzaIngrediente as C ON p.IdPizza = c.IdPizza
WHERE p.IdPizza = @IdPizza
RETURN @result
END

select dbo.NumeroIngredientiPizza('Margherita')


--View
CREATE VIEW MenuPizze AS (
SELECT dbo.Pizza.Nome, dbo.Pizza.Prezzo, dbo.Ingrediente.Nome AS Ingrediente
FROM   dbo.Ingrediente INNER JOIN
             dbo.PizzaIngrediente ON dbo.Ingrediente.IdIngrediente = dbo.PizzaIngrediente.IdIngrediente INNER JOIN
             dbo.Pizza ON dbo.PizzaIngrediente.IdPizza = dbo.Pizza.IdPizza)

select * from MenuPizze;


--funzione che, preso in input il nome della pizza,
--concatena i nomi degli ingredienti di una pizza e
--li restituisce in una stringa separati da virgola
CREATE FUNCTION ListaIngredientiPerPizza(@NomePizza varchar(30)) 
RETURNS VARCHAR(200) 
AS 
BEGIN 
DECLARE @IdPizza int
select @IdPizza= IdPizza 
from Pizza 
where Nome=@NomePizza

DECLARE @ListaIngredienti VARCHAR(200) = '';

SELECT @ListaIngredienti += i.Nome + ', ' 
FROM Pizza p JOIN PizzaIngrediente c ON p.IdPizza = c.IdPizza 
JOIN Ingrediente i ON i.IdIngrediente= c.IdIngrediente 
WHERE p.IdPizza = @IdPizza 
GROUP BY p.IdPizza, i.Nome

SET @ListaIngredienti = 
     CASE @ListaIngredienti WHEN null THEN null 
     ELSE (
         CASE LEN(@ListaIngredienti) WHEN 0 THEN @ListaIngredienti 
            ELSE LEFT(@ListaIngredienti, LEN(@ListaIngredienti) - 1) 
         END 
     ) END
RETURN @ListaIngredienti 
END
 
select dbo.ListaIngredientiPerPizza('Quattro Stagioni')

CREATE VIEW Menu 
AS 
( 
SELECT DISTINCT p.IdPizza, p.Nome, p.Prezzo, dbo.ListaIngredientiPerPizza(p.Nome) 'Ingredienti' 
FROM Pizza p JOIN PizzaIngrediente c ON p.IdPizza = c.IdPizza 
			 JOIN Ingrediente i ON i.IdIngrediente = c.IdIngrediente 
GROUP BY p.IdPizza, p.Nome, p.Prezzo
)

select * from Menu
order by IdPizza;

create view MenuProva as
(select P.Nome, P.Prezzo, string_agg(I.Nome, ', ') as [Ingredienti]
 from Pizza P
 join PizzaIngrediente PIN on P.IdPizza = PIN.IdPizza
 join Ingrediente I on I.IdIngrediente = PIN.IdIngrediente
 group by P.Nome, P.Prezzo)
