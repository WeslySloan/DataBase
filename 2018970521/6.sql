Select starName , title , year from StarsIn , Movie , MovieStar
WHERE title = movieTitle AND name = starName AND year = movieYear AND LOWER (gender) = 'female' AND birthdate > 
(
    Select birthdate from MovieStar , StarsIn
    WHERE name = starName AND LOWER (name) = 'danny devito'
    GROUP BY birthdate
)
AND length IN
(
    Select MAX(length) from Movie , StarsIn , MovieStar
    WHERE title = movieTitle AND name = starName AND year = movieYear AND LOWER (gender) = 'female' AND birthdate > 
        (
            Select birthdate from MovieStar , StarsIn
            WHERE name = starName AND LOWER (name) = 'danny devito'
            GROUP BY birthdate
        )
    GROUP BY starName
)
GROUP BY starName , title , year
ORDER BY title;