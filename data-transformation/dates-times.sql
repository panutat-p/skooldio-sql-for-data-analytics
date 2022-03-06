/*
https://cloud.google.com/bigquery/docs/reference/standard-sql/date_functions
*/

/* ใช้เพื่อแสดงวันหรือเวลาปัจจุบัน */
SELECT
	CURRENT_DATE('+07:00') AS today,
	CURRENT_DATETIME('+07:00') AS today_now,
	CURRENT_TIME('+07:00') AS now,
	CURRENT_TIMESTAMP() AS now_ts;

/*
ข้อมูลวันและเวลา อาจถูกเก็บในรูปแบบอื่น เช่น timestamp ซึ่งแทนจุดเวลาเมื่ออ้างอิง เวลาตามมาตราฐาน unix
unix time ซึ่งแทนจำนวนวินาทีจากวินาทีที่ 0 ในวันที่ 1 มกราคม 1970 (UTC+0) ตามมาตราฐาน unix
ทำให้เราต้องแปลงวันและเวลาให้อยู่ในรูปแบบที่เราจะใช้งานเสียก่อน
*/
SELECT
	DATE(CURRENT_DATETIME()) AS date_from_dt,
	TIME(CURRENT_DATETIME()) AS time_from_dt,
	DATETIME(CURRENT_DATE(), CURRENT_TIME()) AS dt_from_date_time,
	TIMESTAMP(CURRENT_DATETIME('+07:00'), '+07:00') AS ts_from_dt,
	UNIX_SECONDS(CURRENT_TIMESTAMP()) AS unix_secs_UTC,
	TIMESTAMP_SECONDS(UNIX_SECONDS(CURRENT_TIMESTAMP())) AS ts_from_unix_secs;

/* มีอีกหลายฟังก์ชันที่มีประโยชน์เกี่ยวกับวันที่ */
SELECT
	CURRENT_DATE() AS today,
	CURRENT_DATE('-08:00') AS california_today,
	CURRENT_DATE('+07:00') AS bangkok_today,
	DATE(2018, 05, 01) AS laborday2018,
	EXTRACT(MONTH FROM CURRENT_DATE()) AS month,
	EXTRACT(WEEK FROM CURRENT_DATE()) AS week,
	DATE_ADD(CURRENT_DATE(), INTERVAL 10 DAY) AS ten_days_later,
	DATE_SUB(CURRENT_DATE(), INTERVAL 10 DAY) AS ten_days_ago,
	DATE_DIFF(DATE(2018, 05, 01), CURRENT_DATE(), DAY) AS days_until_laborday;

/*
จัดรูปแบบวันและเวลา ให้แสดงแบบที่เราต้องการ FORMAT_DATE(<format>, <datetime>)
เปลี่ยนวันเวลาในรูปแบบเรา ไปเป็น datetime PARSE_DATE(<format>, <string>)
*/
SELECT
	FORMAT_DATE('%x', CURRENT_DATE()),
	FORMAT_DATE('%a %d %b %y', CURRENT_DATE()),
	FORMAT_DATE('%A %B %d, %Y', CURRENT_DATE()),
	PARSE_DATE('%x', '03/27/18'),
	PARSE_DATE('%a %d %b %y', 'Tue 27 Mar 18'),
	PARSE_DATE('%A %B %d, %Y', 'Tuesday March 27, 2018');

/* มีอีกหลายฟังก์ชันที่มีประโยชน์เกี่ยวกับวันและเวลา */
SELECT
	CURRENT_DATETIME() AS now,
	CURRENT_DATETIME('America/Los_Angeles') AS los_angeles_today,
	CURRENT_DATETIME('Asia/Bangkok') AS bangkok_today,
	DATETIME(2018, 03, 28, 9, 0, 0) AS workshop_start,
	DATETIME_ADD(CURRENT_DATETIME('+07:00'), INTERVAL 1 HOUR) AS next_hour,
	DATETIME_SUB(CURRENT_DATETIME('+07:00'), INTERVAL 1 HOUR) AS hour_ago,
	-- Tue 27 Mar 18 14:08:52
	FORMAT_DATETIME('%a %d %b %y %H:%M:%S', CURRENT_DATETIME('+07:00'));
