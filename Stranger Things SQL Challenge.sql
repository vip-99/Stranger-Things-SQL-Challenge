 create database Stranger_Things;
 use Stranger_Things;
 
select * from Characters;
select * from  Locations;
select * from  Events;
select * from  Relationships;
select * from Monsters;
    

Questions
1. Retrieve the names of the characters?
SELECT character_id,name AS characters_name 
FROM Characters;



2. Find characters with age greater than 18?
SELECT character_id,name as characters_name,age 
FROM Characters 
WHERE age>18 
ORDER BY character_id ASC,;



3. Find events in Season 2?
SELECT event_id,event_name AS events 
FROM Events 
WHERE season = 2
ORDER BY event_id ASC;




4. Get details of the 'Mind Flayer' monster?
SELECT * 
FROM Monsters 
WHERE name LIKE '%Mind Flayer%';




5. Retrieve characters and their associated events?
SELECT C.name AS characters_name,E.event_name
FROM Relationships R  
JOIN Characters C 
ON R.character1_id=C.character_id OR R.character2_id=C.character_id
JOIN events E 
ON R.character1_id=E.event_id OR R.character2_id=E.event_id;






6. Calculate the total number of characters from each hometown?
SELECT hometown,COUNT(character_id) AS num_of_character 
FROM Characters
GROUP BY hometown;





7. Retrieve characters who were involved in events in Season 1 or Season 2?
SELECT DISTINCT(C.character_id),C.name AS characters_name FROM Characters C 
JOIN Relationships R 
ON C.character_id=R.character1_id 
OR C.character_id=R.character2_id
JOIN events E
ON R.character1_id=E.event_id 
OR R.character2_id=E.event_id
WHERE E.season IN(1,2)
ORDER BY character_id ASC;





8. Find the top 3 oldest characters?
SELECT character_id,age,name AS oldest_character 
FROM characters 
ORDER BY oldest_character DESC
LIMIT 3;




9. Find the average age of characters in Hawkins?
SELECT ROUND(AVG(age),1) AS average_age 
FROM characters
WHERE hometown='hawkins';




10. Rank characters by age in descending order?
SELECT name,age,
RANK() OVER(ORDER BY age DESC) AS age_rank 
FROM characters;