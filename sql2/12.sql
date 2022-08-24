Select COUNT(title), AVG(length) from Movie , StarsIn
WHERE LOWER (starName) = 'harrison ford' AND title = movieTitle AND year = movieYear