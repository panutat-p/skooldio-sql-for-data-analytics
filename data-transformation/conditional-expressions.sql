/*
https://cloud.google.com/bigquery/docs/reference/standard-sql/functions-and-operators#conditional-expressions
*/

/*
IF(<condition>, <when true do this>, <when false do this>)
NULLIF(<column>, <value>) ถ้าค่าใน column นั้นเท่ากับ value ให้แสดงผลลัพท์เป็น null แต่ถ้าไม่เท่ากับ ให้แสดงค่าเดิมของ column นั้น
COALESCE(<column1>,<column2>, ...,<column N or value>) ให้แสดงค่าตัวแรกที่ไม่เป็น null
*/
SELECT
	*,
	IF(gross > 100, '100M+', 'under 100M') AS type,
	NULLIF(studio, 'จีทีเอช') AS studios1,
	COALESCE(
		NULLIF(studio, 'จีทีเอช'),
		'ปิดทำการ'
	) AS studios2
FROM movies;

/*
CASE
    WHEN <condition1> THEN <value1>
    WHEN <condition2> THEN <value2>
    ...
    ELSE <value>
END
*/
SELECT
	gross,
	CASE
		WHEN gross > 100 THEN '100M+'
		WHEN gross > 50 THEN '50-100M'
		ELSE 'under 50M'
	END AS type
FROM movies;
