/*
https://cloud.google.com/bigquery/docs/reference/standard-sql/query-syntax#group_by_clause
*/

/*
โดยปกติ เรามักไม่ได้ต้องการสรุปข้อมูลจากทั้งตาราง
แต่เราต้องการสรุปข้อมูลเป็นกลุ่มๆ เช่น จากข้อมูล movies
เราอยากได้ข้อมูลว่าค่ายหนังนี้ ผลิตหนังติดท็อป 100 กี่เรื่องแล้ว เป็นต้น
แปลว่า เราอยากแบ่งข้อมูลทั้งตารางออกเป็นกลุ่มๆ ตามค่ายหนังที่เหมือนกัน
แล้วค่อยนับจำนวนข้อมูลในกลุ่ม ว่ามีหนังกี่เรื่องนั่นเอง
*/

/*
แสดงชื่อค่ายหนัง studio
แสดงจำนวนหนังของค่ายหนังนี้ n_rows
แสดงจำนวนหนังของค่ายหนังนี้ที่ทำรายได้มากกว่า 100 ล้าน n_above_100M
แสดงรายได้ทั้งหมดของค่ายหนังนี้ total
แสดงรายได้เฉลี่ยของค่ายหนังนี้ avg_gross
*/
SELECT
	studio,
	COUNT(*) AS n_rows,
	COUNTIF(gross > 100) AS n_above_100M,
	SUM(gross) AS total,
	AVG(gross) AS avg_gross
FROM movies
GROUP BY studio
ORDER BY n_rows DESC;

/*
แสดงชื่อค่ายหนัง studio
แสดงปีที่ค่ายหนังทำหนังออกมา year
แสดงจำนวนหนังของแต่ละค่ายหนังในแต่ละปี n_rows
แสดงรายได้ทั้งหมดของแต่ละค่ายหนังนี้ในแต่ละปี total
*/
SELECT
	studio,
	year,
	COUNT(*) AS n_rows,
	SUM(gross) AS total
FROM movies
GROUP BY 1, 2
-- Equivalently: GROUP BY studio, year
ORDER BY n_rows DESC, year DESC;
