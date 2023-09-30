select *
from [covid 19].dbo.covid_deaths
order by 3, 4

select * 
from [covid 19]..covid_vacination


select location, date, total_cases, new_cases, total_deaths, population
from [covid 19]..covid_deaths
order by 1,2

--total cases/total daeths
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as 'td/tc_prc'
from [covid 19]..covid_deaths
where location like '%iran%'
order by 3

--total cases/population 
select location, date, total_cases, population, (total_cases/population)*100 as 'tc/pop_prc'
from [covid 19]..covid_deaths
where location like 'iran'
order by 3


