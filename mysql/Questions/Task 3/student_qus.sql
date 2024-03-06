USE testdb;

select  stay,
ROUND(AVG(todep),2) as  average_phq, 
ROUND(AVG(tosc),2) as average_scs,
 ROUND(AVG(toas),2) as average_as,
 COUNT(inter_dom) as count_int 
from students
WHERE inter_dom = 'Inter'
GROUP BY stay
ORDER BY stay DESC;








