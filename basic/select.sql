SELECT name AS movie_name
FROM movies;

/* คำสั่ง SELECT ยังสามารถคำนวณค่าบางอย่าง */
SELECT <expression>;
SELECT 1 + 2;

/* แสดงข้อมูลที่ไม่ซ้ำกันเป็นกลุ่มของคอลัมน์ */
SELECT DISTINCT studio, year
FROM movies;

SELECT DISTINCT type
FROM skooldio.posts;

/* หาหนังที่ทำรายได้สูงสุด 3 อันดับแรก โดยแสดงข้อมูลทุกคอลัมน์ และ เรียงจากรายได้สูงสุดไปต่ำสุด */
SELECT *
FROM movies
ORDER BY rank
LIMIT 3;

/* การเรียงลำดับจะเรียงตามคอลัมน์แรกก่อน หากคอลัมน์แรกเท่ากันจึงเรียงตามคอลัมน์ต่อไป */
SELECT *
FROM movies
ORDER BY
	year DESC,
	studio,
	name;
