/*1)Retrieve all stations in the "East" region?*/

SELECT StationName 
FROM stations
WHERE Location = 'East';


/*2)List all shows hosted by "Vrajesh Hirjee"?*/

SELECT s.Showname 
FROM shows s
JOIN hosts h ON h.HostID = s.HostID
WHERE Hostname = 'Vrajesh Hirjee';


/*3)Count the number of awards each show has won?*/

SELECT s.showname, count(awardID) as number_of_awards 
FROM awards a
JOIN shows s ON s.ShowID = a.ShowID
GROUP BY s.ShowName;


/*4)Find shows that have partnerships with "Spotify"?*/

SELECT ShowName 
FROM shows s
JOIN showpartnerships sps ON sps.showID = s.showID 
JOIN partnerships p ON p.partnershipID = sps.partnershipID 
WHERE PartnerName = 'Spotify';


/*5)Retrieve hosts who joined before 2010?*/

SELECT HostName,JoinDate
FROM hosts 
WHERE YEAR(JoinDate)<'2010';


/*6)List the shows and their launch dates in descending order of launch date?*/

SELECT showname, launchdate 
FROM shows 
ORDER BY LaunchDate DESC;


/*7)Find the total count of shows for each host?*/

SELECT Hostname, SUM(showcount) AS Total_Shows
FROM hosts 
GROUP BY Hostname;


/*8)Show the online presence platforms with their links?*/

SELECT PlatformName, Link 
FROM onlinepresence;


/*9)Retrieve the stations in the "South" region launched after 2010?*/

SELECT StationName 
FROM stations
WHERE Location = 'South' AND year(LaunchDate) > '2010';


/*10)Rank hosts based on the number of shows they have hosted?*/

SELECT HostName,
       ShowCount, 
       dense_rank() OVER(ORDER BY ShowCount DESC) as host_rank
FROM hosts;
