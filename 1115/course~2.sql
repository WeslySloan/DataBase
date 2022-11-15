create or replace trigger logging_movie;
after insert on movie
for each row
declare
beign
    insert into dml_history values('INSERT',SSIMESTAMP,'Movie', NULL,
            Null, :new.title||:new.year);
end;