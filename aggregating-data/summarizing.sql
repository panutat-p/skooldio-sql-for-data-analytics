/*
COUNT(*) ใช้นับจำนวนข้อมูลท้้งหมดในตาราง
COUNT(DISTINCT <column>) ใช้นับจำนวนข้อมูลที่ไม่ซ้ำกันในคอลัมน์
COUNTIF(<condition>) ใช้นับจำนวนข้อมูลที่ตรงกับเงื่อนไขที่กำหนด
SUM(<column>) ใช้บวกข้อมูลทั้งหมดในคอลัมน์
MIN(<column>) ใช้หาค่าน้อยที่สุดจากข้อมูลในคอลัมน์
MAX(<column>) ใช้หาค่ามากที่สุดจากข้อมูลในคอลัมน์
AVG(<column>) ใช้หาค่าเฉลี่ยข้อมูลทั้งหมดในคอลัมน์
*/
SELECT
	COUNT(*) AS n_rows,
	COUNT(DISTINCT studio) AS n_studios,
	COUNTIF(gross > 100) AS n_above_100M,
	SUM(IF(gross > 100, 1, 0)) AS n_above_100M_,
	MIN(gross) AS min_gross,
	MAX(gross) AS max_gross,
	SUM(gross) AS total,
	AVG(gross) AS avg_gross,
	SUM(gross) / COUNT(*) AS avg_gross_
FROM movies;

/*
CORR(<column 1>, <column 2>) ใช้บอกว่าคอลัมน์ที่1 มีความสัมพันธ์กับคอลัมน์ที่2 แค่ไหน
STDDEV(<column>) ใช้หาค่าส่วนเบี่ยงเบียนมาตราฐานของข้อมูลในคอลัมน์
VARIANCE(<column>) ใช้หาค่าความแปรปรวนของข้อมูลในคอลัมน์

---for BigQuery only---
APPROX_COUNT_DISTINCT(<column>) ใช้ประมาณจำนวนข้อมูลที่ไม่ซ้ำกันในคอลัมน์
APPROX_QUANTILES(<column>, <number>) ใช้ประมาณค่าควอไทล์ของข้อมูลในคอลัมน์ โดยสามารถกำหนดจำนวนควอไทล์ที่ต้องการได้
*/
SELECT
	STDDEV(gross) AS sd_gross,
	APPROX_QUANTILES(gross, 3) AS quantiles
FROM movies;
