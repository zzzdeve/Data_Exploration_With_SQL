drop view if exists prc_pop_vac_view;
go

create view prc_pop_vac_view 
as
(
select d.continent, d.location, d.date, d.population, v.new_vaccinations,
       sum(cast(v.new_vaccinations as float)) over (partition by d.location 
	                                                order by d.location,d.date) as rolling_total_vaccination
from[covid 19]..covid_deaths d
join [covid 19]..covid_vacination v
on d.location = v.location
and d.date = v.date
where d.continent is not null
)
go

select *
from [covid 19]..prc_pop_vac_view
