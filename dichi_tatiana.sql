create database DischiAlbum

create table Band (
IdBand  int Identity(1,1) not null,
NomeBand nvarchar(30)  unique,
NumeroComponenti Int not null,
constraint PK_Band primary key (IdBand)
)

insert into Band values( 'Maneskin',4) --verifica 

select * from Band 


create table Album (
IdAlbum int identity(1,1) not null constraint PK_IdAlbum primary key,
IdBand int not null constraint FK_IdBand foreign key references Band(IdBand),
TitoloAlbum nvarchar(20) ,
AnnoUscita int ,
CasaDiscografica nvarchar(30),
Genere nvarchar(20),
SupportoDistribuzione nvarchar(30),


constraint Chk_Genere check (Genere='Classico' OR Genere='Jazz' OR Genere='Pop' or Genere='Rock' or Genere='Metal'),
constraint Chk_Distribuzione check (SupportoDistribuzione='CD' OR SupportoDistribuzione='Vinile' OR SupportoDistribuzione='Streaming'),

constraint UK_Album unique (TitoloAlbum,AnnoUscita,CasaDiscografica,Genere,SupportoDistribuzione)
)

 insert into Album values (1,'Fuori di testa', 2021,'Sony Music','Rock','CD') --verifica 
 insert into Album values (1,'Fuori di testa', 2021,'Sony Music','Rock','Vinile')

 select *from Album
 
Create Table Brano(
IdBrano int identity(1000,1) not null constraint PK_IdBrano primary key,
TitoloBrano nvarchar(30) constraint U_titolo unique,
Durata time(0)
)


insert into brano values ('Sono fuori di testa','3:23') --verifica 
select * from brano 


Create Table BranoAlbum(
IdAlbum int constraint FK_BranoAlbum foreign key  references Album (IdAlbum),
IdBrano int constraint FK_BranoAlbum2 foreign key  references Brano(IdBrano)
constraint PK_BranoAlbum primary key (IdAlbum,IdBrano)
)
-- qui faccio un alter table 


  insert into BranoAlbum values (1,1000) -- verifica 
  select * from BranoAlbum



-- inserimento altri dati di prova: 
-- inserimento dati Band 
  insert into Band values( '883',4)
  insert into Band values( 'The Giornalisti',3)

  select * from band



  --inserimento dati Album
 
  insert into Album values (2,'Nord sud ovest est',1993,'Sony Music','Pop','CD') 
  insert into Album values (2,'Nord sud ovest est',1993,'Sony Music','Pop','Vinile') 
  insert into Album values (2,'Grazie mille',1999,'Sony Music','Pop','CD') 
  insert into Album values (2,'Uno in più',2001,'Sony Music','Pop','CD') 
  insert into Album values (2,'Inventato Oggi',2020,'Sony Music','Pop','CD') 
  insert into Album values (1,'Perfetti sconosciuti',2020,'Sony Music','Rock','CD') 
  insert into Album values (1,'Il ballo della vita',2018,'Sony Music','Rock','CD') 
  insert into Album values (1,'Il ballo della vita',2018,'Sony Music','Rock','Streaming') 
  insert into Album values (3,'Vol.1',2011,'Music Record','Rock','Streaming') 
  insert into Album values (3,'Vecchio',2012,'Music Record','Pop','CD') 
  insert into Album values (3,'Fuoricampo',2014,'Music Record','Pop','CD') 
   
   
    
   select * from Album 

   --inserimento dati Brano 
   insert into brano values ('Morirò da re','3:25')
   insert into brano values ('Torna a casa','3:23')
   insert into brano values ('Fear for nobody','4:23')
    insert into brano values ('Immagine','5:23')

   insert into brano values ('Siamo tutti marziani','3:23')
   insert into brano values ('Una canzone per Joss','3:53')

   insert into brano values ('Il tradimento','3:53')
   insert into brano values ('Per lei','2:53')

   insert into brano values ('Canzone senza album','2:53')
   insert into brano values ('Canzone senza album 2','2:53')
   




   -- inserimento dati BranoAlbum
   insert into BranoAlbum values (15,1001)
   insert into BranoAlbum values (16,1001)
   insert into BranoAlbum values (15,1002)
   insert into BranoAlbum values (16,1002) 
   insert into BranoAlbum values (15,1003)
   insert into BranoAlbum values (16,1003)

   insert into BranoAlbum values (4,1004)
   insert into BranoAlbum values (9,1004)
   insert into BranoAlbum values (10,1004)

   insert into BranoAlbum values (17,1005)

   insert into BranoAlbum values (17,1006)
   insert into BranoAlbum values (19,1008)
   insert into BranoAlbum values (18,1007)



  

   select * from Brano
   select * from BranoAlbum 
   select * from album 
 -- Creazione delle query : 

--1) Scrivere una query che restituisca i titoli degli album degli “883” in ordine alfabetico;
 select  distinct a.*
 from album a join Band b on b.IdBand=a.IdBand
 where b.NomeBand='883'
 order by a.TitoloAlbum

--2) Selezionare tutti gli album della casa discografica “Sony Music” relativi all’anno 2020;
  select *
  from album a 
  where a.CasaDiscografica='Sony Music' and a.AnnoUscita=2020

--3) Scrivere una query che restituisca tutti i titoli delle canzoni dei “Maneskin” appartenenti 
--ad album pubblicati prima del 2019;
 select distinct  b.TitoloBrano ,a.AnnoUscita
 from brano b join BranoAlbum ba on b.IdBrano=ba.IdBrano 
              join album a on a.IdAlbum=ba.IdAlbum
			  join band bd on bd.IdBand=a.IdBand
where a.AnnoUscita<2019 and bd.NomeBand='Maneskin'


--4) Individuare tutti gli album in cui è contenuta la canzone “Imagine”;

select a.TitoloAlbum,a.SupportoDistribuzione
from album a join BranoAlbum ba on ba.IdAlbum=a.IdAlbum
             join brano b on b.IdBrano=ba.IdBrano
 where b.TitoloBrano='Immagine'


--5) Restituire il numero totale di canzoni eseguite dalla band “The Giornalisti”;

 select count(br.TitoloBrano) as num_brani_theGiornalisti
 from band b join album a on b.IdBand=a.IdBand 
       join BranoAlbum ba on ba.IdAlbum=a.IdAlbum
	   join brano br on br.IdBrano=ba.IdBrano
	   where b.NomeBand='The Giornalisti'

--6) Contare per ogni album, la “durata totale” cioè la somma dei secondi dei suoi brani 


-- --TODO da covertire 
--select sum(b.Durata)  -- qui devo fare una conversione 
--from album a join BranoAlbum ba on a.IdAlbum= ba.IdAlbum
--             join brano b on b.IdBrano=ba.IdBrano
--group by a.IdAlbum


--7) Mostrare i brani (distinti) degli “883” che durano più di 3 minuti (in alternativa usare i 
--secondi quindi 180 s).

select distinct br.TitoloBrano, br.Durata
from band b join album a on b.IdBand=a.IdBand 
       join BranoAlbum ba on ba.IdAlbum=a.IdAlbum
	   join brano br on br.IdBrano=ba.IdBrano
	   where b.NomeBand='883' and DATEPART(MINUTE,br.Durata)>3

--8) Mostrare tutte le Band il cui nome inizia per “M” e finisce per “n”.  

select b.NomeBand
from band b 
where b.NomeBand like 'M%n'

--9) Mostrare il titolo dell’Album e di fianco un’etichetta che stabilisce che si tratta di un
--Album:
--‘Very Old’ se il suo anno di uscita è precedente al 1980, 
--‘New Entry’ se l’anno di uscita è il 2021, 
--‘Recente’ se il suo anno di uscita è compreso tra il 2010 e 2020, 
--‘Old’ altrimenti.


select a.TitoloAlbum, a.supportodistribuzione,
case
when a.annouscita<1980  then 'Very Old'
when a.annouscita=2021  then 'New Entry'
when a.annouscita between '2010' and '2020'  then 'Recente'
else 'Old'
end as [Etichetta]
from album a 

--10) Mostrare i brani non contenuti in nessun album. select b.titolobrano as BranoSenzaAlbum
 from Brano b 
 where b.TitoloBrano not in (select b.TitoloBrano 
                             from brano b join BranoAlbum ba on b.IdBrano=ba.IdBrano)

--11) Mostra la lista dei album  che contengono almeno 2 canzoni con tipo di supporto e nome del band,     --TODO questa la devo far funzionare --select a.TitoloAlbum, a.SupportoDistribuzione, b.NomeBand--from album a join band b on a.IdBand=b.IdBand --where a.IdAlbum=(select  count (ba.IdBrano) as num_brani--               from BranoAlbum ba join album a  on ba.IdAlbum=a.IdAlbum--	           group by a.IdAlbum--	           having num_brani>2)