SELECT TOP 10 
    t.Name AS TrackName,
    SUM(il.Quantity) AS TotalSold
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
GROUP BY t.Name
ORDER BY TotalSold DESC;

SELECT 
    i.BillingCountry,
    SUM(i.Total) AS Revenue
FROM Invoice i
GROUP BY i.BillingCountry
ORDER BY Revenue DESC;

SELECT 
    YEAR(i.InvoiceDate) AS Year,
    MONTH(i.InvoiceDate) AS Month,
    SUM(i.Total) AS MonthlyRevenue
FROM Invoice i
GROUP BY YEAR(i.InvoiceDate), MONTH(i.InvoiceDate)
ORDER BY Year, Month;

SELECT g.Name AS Genre,
       SUM(il.UnitPrice * il.Quantity) AS TotalRevenue
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY TotalRevenue DESC;

SELECT ar.Name AS Artist,
       SUM(il.UnitPrice * il.Quantity) AS TotalRevenue
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
GROUP BY ar.Name
ORDER BY TotalRevenue DESC;

SELECT 
    t.Name AS TrackName,
    SUM(il.Quantity) AS TotalSold,
    RANK() OVER (ORDER BY SUM(il.Quantity) DESC) AS SalesRank
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
GROUP BY t.Name;
