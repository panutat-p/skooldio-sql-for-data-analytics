/* ต้องการข้อมูลเพียงบางส่วนก่อนจัดกลุ่ม ก็สามารถใส่ WHERE ลงไปได้ดังนี้ */
SELECT
	studio,
	COUNT(*) AS n_rows,
	COUNTIF(gross > 100) * 100.0 / COUNT(*) AS pct_above_100M
FROM movies
WHERE gross > 100
GROUP BY studio
ORDER BY n_rows DESC;

/* ต้องการกรองข้อมูลหลังจัดกลุ่มแล้ว สามารถทำได้โดยใช้คำสั่ง HAVING แทนได้ดังนี้ */
SELECT
	studio,
	COUNT(*) AS n_rows,
	COUNTIF(gross > 100) * 100.0 / COUNT(*) AS pct_above_100M
FROM movies
GROUP BY studio
HAVING n_rows > 5
ORDER BY n_rows DESC;
