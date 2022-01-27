/*
Nikhil Bhalala
CSC 355 Section :401T
--Assignment 4
Date: 10/11/2021,
*/
--Q1)-----
SELECT band.bid,ROUND( AVG(AGE),1) FROM BAND INNER JOIN PLAYER ON BAND.BID = PLAYER.BANDID
GROUP BY BAND.BID
ORDER BY AVG(AGE) DESC;

COMMIT;

--Q2)---
SELECT VNAME FROM VENUE
WHERE VID IN(SELECT VENUEID FROM  show 
WHERE BANDID= (SELECT BID FROM BAND
       WHERE BNAME = 'The NoNos'))
        ORDER BY vname;
 
COMMIT;     
 ----Q3)-----       
SELECT player.pname,  BAND.bname, PLAYER.age FROM PLAYER LEFT OUTER JOIN BAND ON band.bid= PLAYER.BANDID
                WHERE INSTRUMENT ='Vocals'
                ORDER BY AGE ASC;
  
COMMIT;  

--Q4)----
SELECT vname FROM venue
WHERE vid IN (SELECT venueid FROM SHOW
WHERE SHOWDATE  >= date '2021-07-01'  or  SHOWDATE  <= date '2021-07-31');
COMMIT;


--Q5)---
SELECT band.BID, BNAME, COUNT(player.pid) FROM BAND INNER JOIN PLAYER ON BAND.BID = PLAYER.BANDID
GROUP BY band.bid, band.bname
HAVING COUNT(player.pid) >=3;
COMMIT;
---Q6)---
SELECT VID , MAX(show.payment) FROM venue INNER  JOIN show ON show.venueid=venue.vid
GROUP BY venue.vid;
COMMIT;


---Q7)---
SELECT SHOWDATE, VNAME, ((TicketPrice * CAPACITY)- PAYMENT) AS INCOME FROM show INNER JOIN venue ON venue.vid=show.venueid
ORDER BY show.showdate;
COMMIT;

--Q8)
SELECT  BID, COUNT(VenueID),NVL(sum(payment),0) from band LEFT OUTER JOIN show ON band.bid=show.bandid
GROUP BY band.bid
ORDER BY NVL(sum(payment),0) DESC; 
COMMIT;
--




    