create database olympics_analysis;
use olympics_analysis;

#A
select * from olympics;

#B
select name as Athelete_Name, medal as Medals 
from olympics;

#C
select count(distinct name) as Athelete_Count
from olympics;

#D
select * from olympics
where medal="Gold";

#F
select name as Athelete_Name ,year
from olympics
where medal="Silver"
order by year;

#F

select distinct team as Country , count(medal) as Medal_Count
from olympics
where medal in ("Gold", "Silver","Bronze")
group by  team;

#G
select team as Country 
from olympics
where medal ="Gold"
group by  team
having count(medal)>50;

#H
select , count(*) as Medal_count
from olympics
group by name
order by count(medal) desc;

#I
select name as Athelete_Name , count(*) as Total_Medals
from olympics
group by name
order by Total_Medals desc
limit 1;

#J
select distinct event 
from olympics
where event like "%Freestyle%";

#K
select sport , name as Athelete_Name, count(*) as Total_Medals
from olympics 
group by sport ,name
order by Total_Medals desc
limit 3;
 