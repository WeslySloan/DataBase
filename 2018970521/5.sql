Select starName from MovieStar, StarsIn
WHERE starName = NAME AND LOWER (gender) = 'female'
    AND NOT starName =
    (
        SELECT starName from MovieStar, StarsIn
        WHERE LOWER (movieTitle) = 'sting' AND starName = NAME AND LOWER (gender) = 'female'
    )
GROUP BY birthdate, starName
ORDER BY birthdate DESC;