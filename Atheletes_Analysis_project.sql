create database atheletes;

use atheletes;

create table olympics (
ID int,	
Name varchar(255),	
Sex varchar(255),	
Age int,	
Height int,	
Weight int,	
Team varchar(255),	
NOC varchar(255),	
Games varchar(255),	
Year int,	
Season varchar(255),	
City varchar(255),	
Sport varchar(255),	
Event varchar(255),	
Medal varchar(255)
);

show variables like "secure_file_priv";

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Athletes_Cleaned.csv"
into table olympics
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
select * from olympics;

-- SQL PROJECT

-- 1. Show how many medal counts present for entire data

select count(medal) from olympics
where medal <> 'Nomedal';

-- 2. Show count of unique sports present in Olympics
select count( distinct sport) from olympics;

-- 3. Show how many different medals won by team India

select medal,count(*) from olympics
where team='India' and medal != 'Nomedal'
group by medal;

-- 4. Show event wise medals won by India show from 
-- highest to lowest medals won in order

select event,medal,count(*) as medal_count from olympics
where team='India' and medal != 'Nomedal'
group by event,medal
order by medal_count desc;

-- 5. Show event wise medals won by India in order of year

select event,year,medal,count(*) from olympics
where team='India' and medal != 'Nomedal'
group by event,medal,year
order by year;

-- 6. show country who won maximum medals.
select team ,count(*) medal_count from olympics
where medal<>'Nomedal'
group by team 
order by medal_count desc
limit 50;


-- 7.show top 10 countries who won gold

select team,medal from olympics
where medal = 'gold'
group by team
order by medal desc
limit 10;

select * from olympics;
--  8. show in which year did United states won most gold medal

select team,year,medal,count(medal) as max_medal from olympics
where medal = 'gold' and team ='united states'
group by team,year
order by max_medal desc
limit 1;

-- 9. In which sports United States has most medals.
select team, sport,count(medal) as max_medal from olympics
where team = 'united states'
group by team,sport
order by max_medal desc;


-- 10. Find top three players who won most medals along with their sports and country
select name ,team,sport,medal,count(medal) as max_medal from olympics
where medal<> 'nomedal'
group by name,team,sport,medal
order by max_medal desc
limit 1;

-- 11. Find player with most gold medals in cycling along with his country.
select name,team,medal,count(medal) as count_medal,sport from olympics
where medal ='gold' and sport='cycling'
group by name,team,medal
order by count_medal desc
limit 1;

-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
select name,team,sport,medal,count(medal) from olympics
where medal<> 'nomedal' and sport ='basketball'
group by name,team,sport,medal
order by count(medal) desc;

-- 13. Find out the count of different medals of the top basketball player Teresa Edwards
select name,team,sport,medal,count(medal) from olympics
where name='teresa Edwards' and sport = 'basketball'
group by name,team,sport,medal
order by count(medal) desc;

select * from olympics;
-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select sex,medal,count(medal) from olympics
where medal<>'nomedal' 
group by sex,medal
order by count(medal);

