-- Q1: Facilities that charge a fee to members
SELECT name
FROM Facilities
WHERE membercost > 0;


-- Q2: Number of facilities that do not charge a fee
SELECT COUNT(*)
FROM Facilities
WHERE membercost = 0;


-- Q3: Facilities where member fee is less than 20% of monthly maintenance
SELECT facid, name, membercost, monthlymaintenance
FROM Facilities
WHERE membercost > 0
  AND membercost < 0.20 * monthlymaintenance;

-- Q4: Facilities with IDs 1 and 5, without OR
SELECT *
FROM Facilities
WHERE facid IN (1, 5);

-- Q5: Label facilities as cheap or expensive
SELECT
    name,
    monthlymaintenance,
    CASE
        WHEN monthlymaintenance > 100 THEN 'expensive'
        ELSE 'cheap'
    END AS category
FROM Facilities;

-- Q6: Last member(s) who signed up
SELECT firstname, surname
FROM Members
WHERE joindate = (
    SELECT MAX(joindate)
    FROM Members);

-- Q7: Members who have used a tennis court
SELECT DISTINCT
    f.name AS facility,
    m.firstname || ' ' || m.surname AS member
FROM Bookings AS b
JOIN Facilities AS f
    ON b.facid = f.facid
JOIN Members AS m
    ON b.memid = m.memid
WHERE f.name LIKE 'Tennis Court%'
  AND b.memid <> 0
ORDER BY member;

-- Q8: Bookings on 2012-09-14 costing more than $30
SELECT
    f.name AS facility,
    m.firstname || ' ' || m.surname AS member,
    CASE
        WHEN b.memid = 0 THEN b.slots * f.guestcost
        ELSE b.slots * f.membercost
    END AS cost
FROM Bookings AS b
JOIN Facilities AS f
    ON b.facid = f.facid
JOIN Members AS m
    ON b.memid = m.memid
WHERE b.starttime >= '2012-09-14 00:00:00'
  AND b.starttime < '2012-09-15 00:00:00'
  AND (
      CASE
          WHEN b.memid = 0 THEN b.slots * f.guestcost
          ELSE b.slots * f.membercost
      END
  ) > 30
ORDER BY cost DESC;

-- Q9: Bookings on 2012-09-14 costing more than $30, using a subquery
SELECT facility, member, cost
FROM (
    SELECT
        f.name AS facility,
        m.firstname || ' ' || m.surname AS member,
        CASE
            WHEN b.memid = 0 THEN b.slots * f.guestcost
            ELSE b.slots * f.membercost
        END AS cost
    FROM Bookings AS b
    JOIN Facilities AS f
        ON b.facid = f.facid
    JOIN Members AS m
        ON b.memid = m.memid
    WHERE b.starttime >= '2012-09-14 00:00:00'
      AND b.starttime < '2012-09-15 00:00:00'
) AS booking_costs
WHERE cost > 30
ORDER BY cost DESC;

-- Q10: Facilities with total revenue less than $1000
SELECT
    f.name AS facility,
    SUM(
        CASE
            WHEN b.memid = 0 THEN b.slots * f.guestcost
            ELSE b.slots * f.membercost
        END
    ) AS total_revenue
FROM Facilities AS f
JOIN Bookings AS b
    ON f.facid = b.facid
GROUP BY f.facid, f.name
HAVING total_revenue < 1000
ORDER BY total_revenue;

-- Q11: Members and the members who recommended them
SELECT
    m.firstname,
    m.surname,
    r.firstname AS recommender_firstname,
    r.surname AS recommender_surname
FROM Members AS m
LEFT JOIN Members AS r
    ON m.recommendedby = r.memid
ORDER BY m.surname, m.firstname;

-- Q12: Facility usage by members, excluding guests
SELECT
    f.name AS facility,
    COUNT(b.bookid) AS member_usage
FROM Facilities AS f
JOIN Bookings AS b
    ON f.facid = b.facid
WHERE b.memid <> 0
GROUP BY f.facid, f.name
ORDER BY member_usage DESC;

-- Q13: Facility usage by month, excluding guests
SELECT
    f.name AS facility,
    strftime('%m', b.starttime) AS month,
    COUNT(b.bookid) AS member_usage
FROM Facilities AS f
JOIN Bookings AS b
    ON f.facid = b.facid
WHERE b.memid <> 0
GROUP BY f.facid, f.name, month
ORDER BY f.name, month;