/*
https://cloud.google.com/bigquery/docs/reference/standard-sql/functions-and-operators#mathematical-functions
*/

/* มีคอลัมน์เก็บปีหนัง year ที่เป็นพ.ศ. เราอยากแปลง พ.ศ. ให้เป็น ค.ศ. ก็สามารถทำได้ */
SELECT
	name,
	year - 543 AS bc
FROM movies
ORDER BY bc DESC;

/* นำข้อมูลจากหลายคอลัมน์มาคำนวณร่วมกันได้ เช่น เรานิยาม ค่า engagements = จำนวน reactions + comments + shares */
SELECT
	message,
	reactions + comments + shares AS engagements
FROM posts
ORDER BY engagements DESC;

/*
การหารแบบธรรมดา a / b ผลลัพธ์ที่ได้เป็นทศนิยม
การหารแบบจำนวนเต็ม DIV(a, b) หรือหารแบบปัดเศษลง
การหารตามกฎของ IEEE IEEE_DIVIDE(a, b) (ป้องกัน ส่วนเป็น 0)
การหารที่ต้องการ null SAFE_DIVIDE(a, b) (ป้องกัน ส่วนเป็น 0)
*/
SELECT
	5 / 2 AS regular_div,
	DIV(5, 2) AS integer_div,
	-- 5 / 0, Division by Zero Error
	IEEE_DIVIDE(5, 0) AS infinity,
	IEEE_DIVIDE(0, 0) AS not_a_number,
	SAFE_DIVIDE(5, 0) AS return_null;

/*
ปัดขึ้น CEIL(x)
ปัดลง FLOOR(x)
ปัดไปยังจำนวนเต็มที่ใกล้เคียงที่สุด ROUND(x)
ปัดไปยังจำนวนที่ใกล้เคียงที่สุด ตามเลขนัยสำคัญที่ต้องการ ROUND(x, n)
*/
SELECT
	gross,
	CEIL(gross) AS ceil_gross,
	FLOOR(gross) AS floor_gross,
	ROUND(gross) AS round_gross,
	ROUND(gross, 1) AS round_1_gross,
	ROUND(gross, -1) AS round_minus1_gross
FROM movies
LIMIT 5;
