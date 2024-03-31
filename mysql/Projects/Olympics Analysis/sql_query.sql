create database olympics_analysis;
use olympics_analysis;

select * from olympics;

select name as Athelete_Name, medal as Medals 
from olympics;

select count(name) as Athelete_Count
from olympics;

select * from olympics
where medal="Gold";

select name as Athelete_Name ,year
from olympics
where medal="Silver"
order by year;

select distinct team as Country , count(medal) as Medal_Count
from olympics
where medal in ("Gold", "Silver","Bronze")
group by  team;

select distinct team as Country , count(medal) as Gold_Medal
from olympics
where medal ="Gold"
group by  team;


select distinct name as Athelete_Name, count(medal) as Medal_count
from olympics
group by name
order by count(medal) desc;


 