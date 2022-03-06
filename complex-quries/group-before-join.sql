/* this is better */

/*
เมื่อข้อมูลในตารางเราเยอะมาก การนำตารางมา JOIN กัน
ย่อมส่งผลให้ช้าและได้ตารางขนาดใหญ่ขึ้นอีก
ดังนั้นถ้า query เราจำเป็นต้อง GROUP BY
เราสามารถ GROUP BY เพื่อลดขนาดตารางก่อนนำไป JOIN
*/
SELECT
	areas.name AS areaname,
	types.name AS typename,
	providers.n_providers,
	providers.n_beds
FROM (
	SELECT
		areacode,
		typecode,
		COUNT(1) AS n_providers,
		SUM(COALESCE(beds,0)) AS n_beds
	FROM providers
	GROUP BY 1,2
) providers
LEFT JOIN areas
ON providers.areacode = areas.code
LEFT JOIN types
ON providers.typecode = types.code
WHERE areas.name IS NOT NULL;
