-- 1. 

SELECT SUM(new_cases) as total_cases, SUM(CAST(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as float))/SUM(New_Cases)*100 as DeathPercentage
From CovidDeaths
where continent is not null 
order by 1,2

-- 2. 

SELECT location, SUM(CAST(new_deaths as int)) as TotalDeathCount
FROM CovidDeaths
WHERE continent is null 
AND location NOT in ('World', 'European Union', 'International', 'High income', 'Upper middle income', 'Lower middle income', 'Low income')
GROUP by location
ORDER by TotalDeathCount desc


-- 3.

SELECT location, population, MAX(total_cases) as HighestInfectionCount,  Max((CAST(total_cases as float)/population))*100 as PercentPopulationInfected
From CovidDeaths
GROUP by location, population
ORDER by PercentPopulationInfected desc


-- 4.

SELECT location, population, date, MAX(total_cases) as HighestInfectionCount,  Max((CAST(total_cases as float)/population))*100 as PercentPopulationInfected
FROM CovidDeaths
GROUP by location, population, date
ORDER by PercentPopulationInfected desc