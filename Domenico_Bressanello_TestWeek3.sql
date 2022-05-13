create database DaLuigi;

create table Pizza(
IdPizza int Identity(1,1) not null,
PizzaName nvarchar(50) not null unique,
PizzaPrice decimal (5,5) constraint check_price check (PizzaPrice>0), 
constraint PK_PIZZA primary key (IdPizza),
);

create table Ingredients(
IdIngredient int Identity(1,1) not null constraint PK_INGREDIENT primary key,
IngredientName nvarchar(50) not null unique,
IngredientsCost decimal (5,5) constraint check_cost check (IngredientsCost>0), 
StockroomQt int constraint check_stock check (StockroomQt >= 0),
);

create table PizzaIngredients(
IdPizza int not null Constraint FK_PIZZA foreign key references Pizza(IdPizza),
IdIngredient int not null Constraint FK_IGREDIENT foreign key references Ingredients(IdIngredient),
constraint PK_RICETTA_INGREDIENTE primary key (IdPizza, IdIngredient)
)

insert into Pizza values ('Margherita',5)
insert into Pizza values ('Bufala',7)
insert into Pizza values ('Diavola',6)
insert into Pizza values ('Quattro Stagioni',6.50)
insert into Pizza values ('Poricini',7)
insert into Pizza values ('Dioniso',8)
insert into Pizza values ('Ortolana',8)
insert into Pizza values ('Patate e Salsiccia',6)
insert into Pizza values ('Pomodorini',6)
insert into Pizza values ('Quattro Formaggi',7.50)
insert into Pizza values ('Caprese',7.50)
insert into Pizza values ('Zeus',7.50)

insert into Ingredients values ('Pomodoro',2.50,100)
insert into Ingredients values ('Mozzarella',1.50,200)
insert into Ingredients values ('Mozzarella di Bufala',1.50,300)
insert into Ingredients values ('Spianata Piccante',1,150)
insert into Ingredients values ('Funghi',2,170)
insert into Ingredients values ('Carciofi',2.15,0)
insert into Ingredients values ('Cotto',2.25,75)
insert into Ingredients values ('Olive',1.10,50)
insert into Ingredients values ('Funghi Porcini',2.50,35)
insert into Ingredients values ('Stracchino',2.50,350)
insert into Ingredients values ('Speck',3,300)
insert into Ingredients values ('Rucola',1,200)
insert into Ingredients values ('Grana',1.50,250)
insert into Ingredients values ('Verdure di Stagione',1.25,150)
insert into Ingredients values ('Patate',0.75,160)
insert into Ingredients values ('Salsiccia',1.50,170)
insert into Ingredients values ('Pomodorini',1,180)
insert into Ingredients values ('Ricotta',2.50,190)
insert into Ingredients values ('Gorgonzola',3.50,200)
insert into Ingredients values ('Grana',1.50,250)
insert into Ingredients values ('Pomodoro Fresco',1.25,240)
insert into Ingredients values ('Basilico',1.05,230)
insert into Ingredients values ('Bresaola',1.15,210)

insert into PizzaIngredients values (1,1)
insert into PizzaIngredients values (2,5)
insert into PizzaIngredients values (3,2)
insert into PizzaIngredients values (4,3)
insert into PizzaIngredients values (5,5)
insert into PizzaIngredients values (6,9)
insert into PizzaIngredients values (7,8)
insert into PizzaIngredients values (8,2)
insert into PizzaIngredients values (9,5)
insert into PizzaIngredients values (10,2)
insert into PizzaIngredients values (11,1)
insert into PizzaIngredients values (12,10)


--Estrarre tutte le pizze con prezzo superiore a 6 euro.
select *
from Pizza
where PizzaPrice >= 6;

--Estrarre la pizza/le pizze più costosa/e.
SELECT * 
FROM Pizza
WHERE PizzaPrice IN (SELECT MAX(PizzaPrice) FROM Pizza);

--Estrarre le pizze «bianche»
SELECT *
FROM PizzaIngredients 
WHERE IdIngredient <> 2;

--Estrarre le pizze che contengono funghi (di qualsiasi tipo).
SELECT *
FROM PizzaIngredients
WHERE IdIngredient=9 or IdIngredient=5;

------------------------------------------------------------------------------------------------------------------------

--Inserimento di una nuova pizza (parametri: nome, prezzo)
create procedure NewPizza
@pizzaName nvarchar(50)
@pizzaPrice decimal (5,5)
as
insert into Pizza values (@pizzaName, @pizzaPrice)

execute NewPizza 'Bismark', 15
execute NewPizza 'Canadese', 16
execute NewPizza 'Pineapple', 17
execute NewPizza 'Nutella', 20

--Assegnazione di un ingrediente a una pizza (parametri: nome pizza, nome ingrediente) 
create procedure AddIngredient
@pizzaName nvarchar(50)
@ingredientName nvarchar(50)
as
decleare@pizzaId int

select IdPizza = pizzaId
from Pizza pizza
where pizza.PizzaName = @pizzaName

decleare@ingredientId int

select IdIngredient = ingredientId
from Ingredients ingredient
where ingredient.IngredientName = @ingredientName

insert into PizzaIngredients values (@pizzaId, @ingredientId)

go

select * 
from Pizza

select * 
from Ingredients

execute AddIngredient 'Bufala','Mozzarella di Bufala'

--Aggiornamento del prezzo di una pizza (parametri: nome pizza e nuovo prezzo)
create procedure UpdatePrice
@pizzaName nvarchar(50)
@pricePizza int
as
decleare@pizzaId int

select IdPizza = pizzaId
from Pizza pizza
where pizza.PizzaName = @pizzaName

decleare@pizzaPrice int

select PizzaPrice = pizzaPrice
from Pizza pr
where pr.PizzaPrice = @pricePizza

update into PizzaIngredients values (@pizzaPrice)

go

select * 
from Pizza

execute UpdatePrice 'Bufala',60

--Eliminazione di un ingrediente da una pizza (parametri: nome pizza, nome ingrediente)
create procedure RemoveIngredient
@pizzaName nvarchar(50)
@ingredientName nvarchar(50)
as
decleare@pizzaId int

select IdPizza = pizzaId
from Pizza pizza
where pizza.PizzaName = @pizzaName

decleare@ingredientId int

select IdIngredient = ingredientId
from Ingredients ingredient
where ingredient.IngredientName = @ingredientName

delete from PizzaIngredients values (@ingredientId)

go

select * 
from Pizza

select * 
from Ingredients

execute RemoveIngredient 'Bufala','Mozzarella di Bufala'

/*--Incremento del 10% del prezzo delle pizze contenenti un ingrediente (parametro: nome ingrediente) 
create procedure UpdatePrice
@pizzaName nvarchar(50)
@pricePizza int
as
decleare@pizzaId int

select IdPizza = pizzaId
from Pizza pizza
where pizza.PizzaName = @pizzaName

decleare@pizzaPrice int

select PizzaPrice = pizzaPrice
from Pizza pr
where pr.PizzaPrice = @pricePizza

update into PizzaIngredients values (@pizzaPrice)

go

select * 
from Pizza

execute UpdatePrice 'Bufala',60*/ -- to do only if time allows

------------------------------------------------------------------------------------------------------------------------

--Tabella listino pizze (nome, prezzo) (parametri: nessuno)
create function Print_Pizze()
returns table
as
Return
select p.PizzaName, p.PizzaPrice
from Pizza p join Pizza l on l.IdPizza=p.IdPizza
where l.Pizza=@pizzaName

--richiamo la funzione appena creata
select * from dbo.DaLuigi('All Pizzas')


--Tabella listino pizze (nome, prezzo) contenenti un ingrediente (parametri: nome ingrediente)
create function NumePizzasWith(@nomeIng varchar(50))
returns int
as
begin
declare @numeroPizze int
select @numeroPizze=COUNT(*)
from Pizza p join Ingredients i on i.IdIngredient=p.IdIngredient
where m.IngredientName=@nomeIng

return @numeroPizze
end
go

/*--Tabella listino pizze (nome, prezzo) che non contengono un certo ingrediente (parametri: nome ingrediente)
create function Print_Pizze_No_Funghi(@pizzaName nvarchar(50), @pizzaPrice int)
returns table
as
Return
select p.PizzaName, p.PizzaPrice
from Pizza p join Pizza l on l.IdPizza=p.IdPizza
where l.Pizza=@pizzaName

--richiamo la funzione appena creata
select * from dbo.DaLuigi('All Pizzas')*/


--Calcolo numero pizze contenenti un ingrediente (parametri: nome ingrediente)
create function PizzeWithIng(@ingName varchar(50))
returns int
as
begin
declare @pizzeNumber int
select @pizzeNumber=COUNT(*)
from Pizza p join Ingredient i on i.IdIngredient=p.IdIngredient
where p.IngredientName=@ingName

return @pizzeNumber
end
go

select dbo.PizzeWithIng('PizzaIngredients');

--Calcolo numero pizze che non contengono un ingrediente (parametri: codice ingrediente)
create function PizzeWithoutIng(@ingName varchar(50))
returns int
as
begin
declare @pizzeNumber int
select @pizzeNumber=COUNT(*)
from Pizza p join Ingredient i on i.IdIngredient=p.IdIngredient
where p.IngredientName=@ingName

return <> @pizzeNumber
end
go

select dbo.PizzeWithoutIng('PizzaNotIngredients');


--Calcolo numero ingredienti contenuti in una pizza (parametri: nome pizza)
create function NumIngredients(@numPizza varchar(50))
returns int
as
begin
declare @numeroIng int
select @numeroIng=COUNT(*)
from Ingredients i join Pizza p on p.IdPizza=i.IdPizza
where m.PizzaName=@numPizza

return @numeroIng
end
go

select dbo.NumIngredients('Ingredients');
------------------------------------------------------------------------------------------------------------------------

/*--Realizzare una view che rappresenta il menù con tutte le pizze.
create view PizzasMenu  
as  
select p.PizzaName, p.PizzaPrice  
from PizzaIngredients as p join Pizzas.Pizzas as  i  
on p. = i. ;   
go 
  
select FirstName, LastName, HireDate  
from PizzasMenu 
order by PizzasName;*/ --to finish only if time allows
