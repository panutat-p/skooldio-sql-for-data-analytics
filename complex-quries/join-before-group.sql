/*
ช่วยจัดกลุ่มข้อมูลตามชื่อ areas และ types
แสดงผลลัพท์ในชื่อคอลัมน์ areaname และ typename
และคำนวณจำนวน providers และจำนวน beds ในแต่ละกลุ่ม
แสดงผลลัพท์ในชื่อคอลัมน์ n_providers และ n_beds
หากไม่มีข้อมูล beds ให้แสดงจำนวนเป็น 0 ไม่ใช่ null
โดยกรองข้อมูลที่ areas ไม่มีชื่อ name ออก
*/

SELECT
	areas.name AS areaname,
	types.name AS typename,
	COUNT(1) AS n_providers,
	SUM(COALESCE(beds,0)) AS n_beds
FROM providers
LEFT JOIN areas
ON providers.areacode = areas.code
LEFT JOIN types
ON providers.typecode = types.code
WHERE areas.name IS NOT NULL
GROUP BY areas.name, types.name;
