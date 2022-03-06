/*
เราสามารถ JOIN ติดต่อกันได้หลายครั้งใน query
โดยลำดับการ JOIN จะเรียงจากซ้ายไปขวา (หรือ บนลงล่าง)
ยกเว้นแต่มีการใส่วงเล็บ เพื่อให้ JOIN ในวงเล็บก่อน
*/
SELECT
	providers.*,
	areas.name AS areaname,
	types.name AS typename
FROM providers
LEFT JOIN areas
ON providers.areacode = areas.code
LEFT JOIN types
ON providers.typecode = types.code;
