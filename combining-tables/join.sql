/*
หาก SELECT <column> ชื่อที่ซ้ำกันจากทั้ง 2 ตาราง
จำเป็นต้องตั้งชื่อใหม่ เพื่อไม่ให้เกิดความกำกวมขึ้น

หมายเหตุ INNER JOIN จะรวม 2 ตารางเข้าด้วยกัน
โดยจำเป็นต้องมีข้อมูลที่ตรงกันทั้ง 2 ตาราง
หากตารางใดไม่มีข้อมูลตรงกับอีกตารางหนึ่ง
ข้อมูลนั้นจะไม่ถูกรวมในตารางที่ถูกสร้างขึ้นใหม่
*/

/* INNER JOIN */
SELECT
	providers.name,
	providers.areacode,
	areas.name AS areaname
FROM providers
INNER JOIN areas
ON providers.areacode = areas.code;

/* LEFT OUTER JOIN */
SELECT
	providers.name,
	providers.areacode,
	areas.name AS areaname
FROM providers
LEFT JOIN areas
ON providers.areacode = areas.code
WHERE areas.name IS NULL;

/* RIGHT OUTER JOIN */
SELECT
	providers.name,
	providers.typecode,
	types.name AS typename
FROM providers
RIGHT JOIN types
ON providers.typecode = types.code;
