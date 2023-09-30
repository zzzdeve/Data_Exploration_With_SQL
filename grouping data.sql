--country with highset ifected compare to population
select location, max(total_cases) as highestinfection, population, max((total_cases/population))*100 as 'tc/pop_prc'
from [covid 19]..covid_deaths
group by location,population
order by 4 desc

--countries with highset death count based on income
select location, max(total_deaths) as highestdeaths
from [covid 19]..covid_deaths
where location like '%income%'
group by location
order by 2 desc

--break down dataset by continent
select continent, max(total_deaths) as highestdeaths
from [covid 19]..covid_deaths
where continent is not null
group by continent
order by 2 desc

--global numbers
select date, sum(total_cases) as total_cases,sum(total_deaths) as total_daeths,
sum(total_deaths)/sum(total_cases)*100 as death_percentage
from [covid 19]..covid_deaths
where continent is not null
group by date
order by 1

