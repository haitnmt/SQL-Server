SELECT * 
FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY MaChuSuDung) AS RowNum
    FROM ChuSuDung
) AS MyDerivedTable
WHERE MyDerivedTable.RowNum BETWEEN 101 AND 200