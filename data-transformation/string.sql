/*
https://cloud.google.com/bigquery/docs/reference/standard-sql/functions-and-operators#string-functions
*/

/*
CHAR_LENGTH(x) ใช้หาจำนวนตัวอักษรของข้อความ
CONCAT(a, b, ...) ใช้ต่อข้อความเข้าด้วยกัน
START_WITH(x, y) ใช้หาว่า มีข้อความ y อยู่ในข้อความ x หรือไม่
LOWER(x) แปลงข้อความ x เป็นตัวพิมพ์เล็กทั้งหมด
REPLACE(s, x, y) ในข้อความ s ถ้าเจอข้อความ x ให้เปลี่ยนเป็นข้อความ y
SUBSTR(x, p, l) ในข้อความ x ตัดเอาเฉพาะข้อความที่เริ่มที่ตำแหน่ง p ด้วยความยาว l
FORMAT(<format>, x) ใช้จัดรูปแบบจากข้อมูล x
REGEXP_EXTRACT(x, <regexp>) ใช้ดึงข้อมูลด้วยรูปแบบของ regular expression
*/
SELECT
	name,
	CHAR_LENGTH(name) AS n_characters,
	CONCAT(
		name, ' (', CAST(year AS STRING), ')'
	) AS name_with_year,
	STARTS_WITH(name, 'รัก') AS starts_with_love,
	LOWER(name) AS all_caps_name,
	REPLACE(studio, 'จีทีเอช', 'GTH') AS rename_gth,
	SUBSTR(CAST(year AS STRING), 3, 2) AS short_year,
	FORMAT('%.2f', gross) AS formatted_gross,
	REGEXP_EXTRACT(name, r'\d+') AS first_number,
	MOD(year, 100) AS short_year_int
FROM movies;

