/* หากเราต้องการเปลี่ยนชนิดข้อมูล เราสามารถใช้คำสั่ง CAST(x AS type) โดยคำสั่ง CAST จะพยายามแปลงข้อมูลให้เรา ถ้ามันสามารถแปลงได้ */
SELECT
	CAST(13.724 AS INT64),
	CAST(13 AS FLOAT64),
	CAST('13' AS INT64),
	CAST('13.724' AS FLOAT64),
	CAST(2 AS BOOL),
	CAST(0 AS BOOL),
	CAST(13.724 AS STRING);
