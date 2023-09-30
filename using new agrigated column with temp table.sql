drop table if exists prc_pop_vac

create table prc_pop_vac
(
continent nvarchar(255), 
location nvarchar(255), 
date datetime,
population float,
new_vaccinated float,
rolling_total_vaccination float
)
insert into prc_pop_vac
select d.continent, d.location, d.date, d.population, v.new_vaccinations,
       sum(cast(v.new_vaccinations as float)) over (partition by d.location 
	                                                order by d.location,d.date) as rolling_total_vaccination
from[covid 19]..covid_deaths d
join [covid 19]..covid_vacination v
on d.location = v.location
and d.date = v.date
--where d.continent is not null

select *,(rolling_total_vaccination/population)*100 as 'roltotalvac/population'
from prc_pop_vac
