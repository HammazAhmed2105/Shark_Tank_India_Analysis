select * from project.shark_tank_dataas;

-- total episodes

select max(ep_no) from project.shark_tank_dataas;
select count(distinct ep_no) from project.shark_tank_dataas;

-- pitches 

select count(distinct brand) from project.shark_tank_dataas;

-- pitches converted

select cast(sum(a.converted_not_converted) as float) /cast(count(*) as float) as Percentage_of_Pitches_Converted from (
select amount_invested_lakhs , case when amount_invested_lakhs>0 then 1 else 0 end as converted_not_converted from project.shark_tank_dataas) a;

-- total male

select sum(male) from project.shark_tank_dataas;

-- total female

select sum(female) from project.shark_tank_dataas;

-- gender ratio

select sum(female)/sum(male) from project.shark_tank_dataas;

-- total invested amount

select sum(amount_invested_lakhs) from project.shark_tank_dataas;

-- avg equity taken

select avg(a.equity_taken) from
(select * from project.shark_tank_dataas where equity_taken>0) a;

-- highest deal taken

select max(amount_invested_lakhs) from project.shark_tank_dataas;

-- higheest equity taken

select max(equity_taken) from project.shark_tank_dataas;


-- pitches converted having atleast ne women

select * from project.shark_tank_dataas;


select sum(b.female_count) from(

select case when a.female>0 then 1 else 0 end as female_count ,a.*from (
(select * from project.shark_tank_dataas where deal!='No Deal')) a)b;

-- avg team members

select avg(team_members) from project.shark_tank_dataas;

-- amount invested per deal

select avg(a.amount_invested_lakhs) amount_invested_per_deal from
(select * from project.shark_tank_dataas where deal!='No Deal') a;

-- avg age group of contestants

select avg_age,count(avg_age) cnt from project.shark_tank_dataas group by avg_age order by cnt desc;

-- location group of contestants

select location,count(location) cnt from project.shark_tank_dataas group by location order by cnt desc;

-- sector group of contestants

select sector,count(sector) cnt from project.shark_tank_dataas group by sector order by cnt desc;


-- partner deals

select partners,count(partners) cnt from project.shark_tank_dataas  where partners!='-' group by partners order by cnt desc;

-- making the matrix


select * from project.shark_tank_dataas;

select 'Ashnner' as keyy,count(ashneer_amount_invested) from project.shark_tank_dataas where ashneer_amount_invested is not null;


select 'Ashnner' as keyy,count(ashneer_amount_invested) from project.shark_tank_dataas where ashneer_amount_invested is not null AND ashneer_amount_invested!=0;

SELECT 'Ashneer' as keyy,SUM(C.ASHNEER_AMOUNT_INVESTED),AVG(C.ASHNEER_EQUITY_TAKEN) 
FROM (SELECT * FROM project.shark_tank_dataas WHERE ASHNEER_EQUITY_TAKEN!=0 AND ASHNEER_EQUITY_TAKEN IS NOT NULL) C;


select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Ashneer' as keyy,count(ashneer_amount_invested) total_deals_present from project.shark_tank_dataas where ashneer_amount_invested is not null) a

inner join (
select 'Ashneer' as keyy,count(ashneer_amount_invested) total_deals from project.shark_tank_dataas
where ashneer_amount_invested is not null AND ashneer_amount_invested!=0) b 

on a.keyy=b.keyy) m

inner join 

(SELECT 'Ashneer' as keyy,SUM(C.ASHNEERAMOUNTINVESTED) total_amount_invested,
AVG(C.ASHNEEREQUITYTAKENP) avg_equity_taken
FROM (SELECT * FROM project.shark_tank_dataas  WHERE ASHNEER_EQUITY_TAKEN!=0 AND ASHNEER_EQUITY_TAKEN IS NOT NULL) C) n

on m.keyy=n.keyy