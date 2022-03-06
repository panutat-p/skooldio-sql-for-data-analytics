/* เรามักจะอยากเห็นข้อมูลเพียงบางส่วนจากทั้งตาราง */
SELECT name
FROM movies
WHERE studio = 'จีทีเอช';

/* หาหนังที่ทำรายได้ gross มากกว่า 250 ล้าน */
SELECT *
FROM movies
WHERE gross > 250;

/*
pattern จะรองรับตัวอักษรพิเศษ wildcard 2 ตัวได้แก่
ตัวอักษร % จะใช้แทนตัวอักษรใด ๆ ตั้งแต่ 0 ตัวขึ้นไป
ตัวอักษร _ จะใช้แทนตัวอักษรใด ๆ เพียง 1 ตัวเท่านั้น
*/

/* หาหนังที่ชื่อ name มีคำว่า รัก */
SELECT *
FROM movies
WHERE name LIKE '%รัก%';

/* หาหนังที่ชื่อ name ขึ้นต้นด้วยคำว่า รัก */
SELECT *
FROM movies
WHERE name LIKE 'รัก%';

/* หาหนังที่ค่ายหนัง studio ที่ไม่ใช่ทั้ง จีทีเอช และ จีดีเอช ห้าห้าเก้า */
SELECT *
FROM movies
WHERE studio NOT IN ('จีทีเอช', 'จีดีเอช ห้าห้าเก้า');

/* หาหนังที่มีรายได้ gross ตั้งแต่ 200 ล้าน ถึง 300 ล้าน */
SELECT *
FROM movies
WHERE gross BETWEEN 200 AND 300;
