/* Average IMDB ratings of Genres with Occurance>10 */

SELECT genre, COUNT(genre) AS Occurance, AVG(imdb) AS Average_IMDB
FROM netflix.netflixoriginals_dataset
GROUP BY genre HAVING occurance >10
ORDER BY Average_IMDB DESC;

/* Top 10 most Occuring Languages in the Netflix Originals */

SELECT language, COUNT(language) as OccuranceValue
FROM netflix.netflixoriginals_dataset
GROUP BY language 
ORDER BY OccuranceValue DESC LIMIT 10;

/* Top 10 movies with Highest IMDB */

SELECT title, IMDB
FROM netflix.netflixoriginals_dataset
ORDER BY IMDB DESC LIMIT 10;

/* 5 Languages with lowest IMDB Rating */

SELECT language, AVG (IMDB) AS Average_IMDB
FROM netflix.netflixoriginals_dataset
GROUP BY language 
ORDER BY Average_IMDB LIMIT 5;

/* Total Run-Time of Each Year */

SELECT RIGHT(premiere, 4) AS Year, 
SUM(Runtime) AS Total_Runtime
FROM netflix.netflixoriginals_dataset
GROUP BY year ORDER BY year;

/* Average Runtime of Top 3 Languages */

SELECT language, AVG(Runtime) AS Average_Runtime
FROM netflix.netflixoriginals_dataset
WHERE language = 'English'
UNION
SELECT language, AVG(Runtime) AS Average_Runtime
FROM netflix.netflixoriginals_dataset
WHERE language = 'hindi'
UNION
SELECT language, AVG(Runtime) AS Average_Runtime
FROM netflix.netflixoriginals_dataset
WHERE language = 'Spanish';

/* Movies Premiered Each Year */

SELECT RIGHT (premiere, 4) AS year, 
COUNT(Premiere) AS Movies_Premiered
FROM netflix.netflixoriginals_dataset
GROUP BY year ORDER BY year;

/* IMDB Ratings of English Documentaries Premiered Between June 2019 and June 2020 */

SELECT title, IMDB, premiere, genre, language
FROM netflix.netflixoriginals_dataset
WHERE genre = 'Documentary' AND language = 'english' AND
(premiere LIKE '%2019%' OR premiere LIKE '%2020%') AND
premiere NOT LIKE '%january%2019%' AND premiere NOT LIKE '%february%2019%' AND premiere NOT LIKE '%march%2019%' AND premiere NOT LIKE '%april%2019%' AND 
premiere NOT LIKE '%may%2019%' AND premiere NOT LIKE '%july%2020%' AND premiere NOT LIKE '%august%2020%' AND premiere NOT LIKE '%september%2020%' AND 
premiere NOT LIKE '%october%2020%' AND premiere NOT LIKE '%november%2020%' AND premiere NOT LIKE '%december%2020'