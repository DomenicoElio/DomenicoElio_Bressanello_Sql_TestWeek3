# DomenicoElio_Bressanello_TestWeek3
sql test: 

Il sig. Luigi ha commissionato la creazione di un database che possa tenere traccia di tutte 
le pizze che vengono riportate nel suo menù.
In particolare ogni pizza deve essere identificata da un codice, dal nome e dal prezzo.
Ogni pizza può contenere uno o più ingredienti caratterizzati da codice, nome, costo e 
scorte in magazzino.
Deve essere possibile tenere traccia delle composizioni delle pizze. 
Impostare i seguenti controlli:
Il prezzo della pizza, il costo dell’ingrediente (> 0). Le scorte in magazzino invece devono 
essere >=0,


Si implementino le seguenti query:
1. Estrarre tutte le pizze con prezzo superiore a 6 euro.
2. Estrarre la pizza/le pizze più costosa/e.
3. Estrarre le pizze «bianche»
4. Estrarre le pizze che contengono funghi (di qualsiasi tipo).

Implementare sul DB appena costruito le seguenti procedure:
1. Inserimento di una nuova pizza (parametri: nome, prezzo) 
2. Assegnazione di un ingrediente a una pizza (parametri: nome pizza, nome 
ingrediente) 
3. Aggiornamento del prezzo di una pizza (parametri: nome pizza e nuovo prezzo)
4. Eliminazione di un ingrediente da una pizza (parametri: nome pizza, nome 
ingrediente) 
5. Incremento del 10% del prezzo delle pizze contenenti un ingrediente 
(parametro: nome ingrediente)


Si implementino le seguenti funzioni:
1. Tabella listino pizze (nome, prezzo) (parametri: nessuno)
2. Tabella listino pizze (nome, prezzo) contenenti un ingrediente (parametri: nome
ingrediente)
3. Tabella listino pizze (nome, prezzo) che non contengono un certo ingrediente
(parametri: nome ingrediente)
4. Calcolo numero pizze contenenti un ingrediente (parametri: nome ingrediente)
5. Calcolo numero pizze che non contengono un ingrediente (parametri: codice
ingrediente)
6. Calcolo numero ingredienti contenuti in una pizza (parametri: nome pizza)



Realizzare una view che rappresenta il menù con tutte le pizze.
Opzionale: la vista deve restituire una tabella con prima colonna
contenente il nome della pizza, seconda colonna il prezzo e terza
colonna la lista unica di tutti gli ingredienti separati da virgola.

