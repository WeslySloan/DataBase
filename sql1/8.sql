Select MOVIEEXEC.NAME FROM STUDIO , MOVIEEXEC
WHERE PRESNO = CERTNO AND STUDIO.NAME = LOWER('FOX');