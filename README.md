# Backendprogrammering och databaser - Labb 1

## Outcome

• Final grade: VG

• Time to completion: 6h

### Notes about project:

Biggest challenge was to scale up the database and figure out how to make my own csv files.

## Mål

I Labb 1 planerar vi och bygger upp en relationsdatabas. Den ska vara normaliserad utifrån syftet och
innehållet för databasen. Vi använder frågespråket SQL för att lägga till, uppdatera och få ut relevant
data från databasen.

## Syfte

Studenten ska efter slutförd kurs kunna behärska språket SQL. Studenten ska också kunna designa en
databas och förstå hur designvalet påverkar databasens effektivitet och prestanda.

## Uppgift

I Labb 1 planerar
och designar vi en databas och använder sedan SQL för att skapa tabeller och köra frågor mot
databasen.

### Deadline

Labb 1 ska lämnas in senast tisdag 22/3 kl.23.59.
Redovisning
Redovisning sker genom en kortare presentation för klassen onsdag 23/3 (ca 5 minuter), där följande
sammanfattas och presenteras.
• Du ska förklara databasens syfte och innehåll.
• Du ska ge exempel på databasens struktur med tabeller och relationer.
• Du ska ge exempel och köra några SQL-frågor mot databasen som visar hur det hänger ihop.
Utgå från kraven för respektive G och VG när du planerar vad du ska presentera på
redovisningen.

### Uppgift

• Du ska själv bestämma och planera vad databasen ska innehålla.
• Du ska kunna visa, lägga till, uppdatera och ta bort data i en relationsdatabas.
• Vi använder MySQL och frågespråket SQL (både för att skapa tabeller och köra frågor mot
databasen).
• Inlämningsuppgiften ska göras individuellt.
Följande ska finnas med när du lämnar in labben:
• SQL som skapar tabeller och fyller den med lite data så att den enkelt går att använda (som
textfil eller SQL-fil).
• SQL-frågor, se ”krav på betyg” (som textfil eller SQL-fil).
• ER-diagram eller motsvarande.
• Namnge alla filer med klass och ditt namn.
Betygskriterier

#### Krav för G

• Du ska planera databasen med t ex ER-diagram.
• Du ska skapa tabellerna med SQL.
• Du ska skriva SQL-frågor som visar, lägger till, uppdaterar och kan ta bort relevant data
(CRUD).
• Databasen ska innehålla minst tre tabeller med kopplingar mellan två av tabellerna (ett-tillmånga-förhållande) och innehålla referensintegritet (primary key och foreign key).
• SQL-frågorna ska ge en bild över databasens syfte och innehåll genom att få ut relevant data
där det visar hur kopplingen mellan minst två av tabellerna hänger ihop genom INNER JOIN.
• Du ska kunna visa enkel användning av statistik (användning av minst en funktion) t ex visa
antal rader i en tabell, räkna ut medelvärde.
• Du ska använda minst en vy.
• Du ska använda en transaktion på någon del av SQL-koden t ex INSERT, UPDATE, DELETE.
• Du ska visa genom minst två relevanta SQL-frågor att databasen har referensintegritet
mellan tabellerna.

#### Krav för VG

Utöver kraven för G:
• Databasen ska innehåll minst fem tabeller där det är kopplingar mellan tre av tabellerna
(många-till-många-förhållande) och innehålla referensintegritet (primary key och foreign
key). Använd också unika index där det behövs för att kontrollera integriteten på datan.
• SQL-frågorna ska ge en tydlig bild över databasens syfte och innehåll genom att få ut relevant
data där många-till-många-förhållandet framgår genom någon typ av JOIN.
• Du ska använda minst två Stored proceduers och/eller Triggers.
Litteratur
Kurskompendiet och powerpoints från föreläsningarna.
