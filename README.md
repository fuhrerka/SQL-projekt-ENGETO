SQL-projekt-ENGETO
Projekt v rámci datové akademie Engeto
# SQL projekt – studie dostupnosti základnách potravin na základě průměrných příjmů
## Úvod do projektu
Analytické oddělení společnosti zabývající se životní úrovní občanů realizuje projekt zaměřený na monitoring dostupnosti základních potravin pro širokou veřejnost. Jeho podstatou je připravit datové podklady vycházející ze sledování vztahu průměrných mezd k cenám základních potravin ve sledovaném období, tj. v letech 2006-2018.
Zodpovězením pěti klíčových otázek (viz níže) budou získána data potřebná pro prezentaci na tiskové konferenci zaměřené na oblast životní úrovně lidí v České republice. Jako doplňující materiál byla připravena i tabulka s HDP, GINI koeficientem a populací dalších evropských států v období, které sledujeme u ČR.

## Použitá data 
### Primární tabulky
1.	czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
2.	czechia_payroll_calculation – Číselník kalkulací v tabulce mezd.
3.	czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.
4.	czechia_payroll_unit – Číselník jednotek hodnot v tabulce mezd.
5.	czechia_payroll_value_type – Číselník typů hodnot v tabulce mezd.
6.	czechia_price – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
7.	czechia_price_category – Číselník kategorií potravin, které se vyskytují v našem přehledu.
Číselníky sdílených informací o ČR:
1.	czechia_region – Číselník krajů České republiky dle normy CZ-NUTS 2.
2.	czechia_district – Číselník okresů České republiky dle normy LAU.
### Dodatečné tabulky:
1.	countries - Všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace.
2.	economies - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.

## Výstup z projektu
Výstupem z projektu jsou dvě tabulky *t_katerina_fuhrerova_ project_SQL_primary_finale* a *t_katerina_fuhrerova_ project_SQL_secondary_finale*, ze kterých se dají získat data potřebná ke zodpovězení zadaných výzkumých otázek. 

## Výzkumné otázky a odpovědi

### 1.	Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
V analýze sledujeme mezi lety 2006 a 2018 celkem 19 profesních oblastí. Během těchto let dochází k celkovému nárůstu mezd ve všech odvětvích, ale růst nebyl lineární. Existují roky, kdy došlo k mírnému propadu, např. v roce 2013 postihl meziroční pokles mezd 11 z 19 sledovaných odvětví. Nejčastěji klesly platy v oblasti Těžby a dobývání, čtyřikrát během sledovaných let, zatímco v kategoriích Zpracovatelský průmysl, Zdravotní a sociální péče a Ostatní činnosti k poklesu nedošlo vůbec.  

### 2.	Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd? 
Data porovnáváme v letech 2006 a 2018. V prvním roce bylo možné si za průměrnou mzdu koupit 1313 kg chleba a 1466 l mléka. V posledním sledovaném roce to bylo1365 kg chleba a 1670 l mléka. Z výsledků plyne, že přestože potraviny zdražily, zvýšily se i průměrné mzdy a lidé si těchto potravin mohli koupit více.

###  3.	Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
Nejpomaleji zdražuje Cukr krystalový, u jehož ceny byl meziroční pokles o 1,92 %. Snížení vykazuje též meziroční cena položky Rajská jablka červená kulatá, klesla o 0,74 %. Naopak největší nárůst zaznamenaly Papriky, jejich cena se zvýšila o 7, 29 %.

### 4.	Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
Při analýze meziročních nárůstů nebyl v žádném sledovaném období zaznamenán nárůst cen potravin, který by převýšil růst mezd o více než 10 %. Maximální zjištěný nárůst byl v roce 2013, tehdy činil 6,66 %. Naopak k největšímu poklesu došlo v roce 2009, snížení bylo o 9,48 %.

### 5.	Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
HDP je makroekonomický ukazatel, který se do peněženek občanů (mzdy) promítá s určitou setrvačností, obvykle 1–2 roky.  Obecně lze říci, že HDP má výraznější vliv na mzdy než na ceny, mzdy obvykle reagují na změny HDP rychleji. Viz. Graf.


<img width="1652" height="992" alt="graf" src="https://github.com/user-attachments/assets/de95e39d-a808-44de-8629-29cfa1132a57" />

