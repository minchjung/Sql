
CREATE TABLE `MEMBER` (
	`uid`  VARCHAR(10) PRIMARY KEY, 
	`name` VARCHAR(10),
	`hp`   CHAR(13),
	`pos`  VARCHAR(10),
	`dep`  TINYINT,
	`rdate` DATETIME
	
);
CREATE TABLE `DEPART`(
	`depNo` 	TINYINT PRIMARY KEY,
	`name`	VARCHAR(10),
	`tel`		CHAR(12)
	
);
CREATE TABLE `SALE`(
	`seq`		INT AUTO_INCREMENT PRIMARY KEY,
	`uid`		VARCHAR(10),
	`year`	YEAR,
	`month`	TINYINT,
	`sales`	INT
);

INSERT INTO `MEMBER` VALUES('a101','박혁거세','010-1234-1001','부장',101,NOW());
INSERT INTO `MEMBER` VALUES('a102','김유신','010-1234-1002','차장',101,NOW());
INSERT INTO `MEMBER` VALUES('a103','김춘추','010-1234-1003','사원',101,NOW());
INSERT INTO `MEMBER` VALUES('a104','장보고','010-1234-1004','대리',102,NOW());
INSERT INTO `MEMBER` VALUES('a105','강감찬','010-1234-1005','과장',102,NOW());
INSERT INTO `MEMBER` VALUES('a106','이성계','010-1234-1006','차장',103,NOW());
INSERT INTO `MEMBER` VALUES('a107','정철','010-1234-1007','차장',103,NOW());
INSERT INTO `MEMBER` VALUES('a108','이순신','010-1234-1008','부장',104,NOW());
INSERT INTO `MEMBER` VALUES('a109','허균','010-1234-1009','부장',104,NOW());
INSERT INTO `MEMBER` VALUES('a110','정약용','010-1234-1010','사원',105,NOW());
INSERT INTO `MEMBER` VALUES('a111','박지원','010-1234-1011','사원',105,NOW());

INSERT INTO `DEPART` VALUES( 101,'영업1부','051-512-1001');
INSERT INTO `DEPART` VALUES( 102,'영업2부','051-512-1002');
INSERT INTO `DEPART` VALUES( 103,'영업3부','051-512-1003');
INSERT INTO `DEPART` VALUES( 104,'영업4부','051-512-1004');
INSERT INTO `DEPART` VALUES( 105,'영업5부','051-512-1005');
INSERT INTO `DEPART` VALUES( 106,'영업지원부','051-512-1006');
INSERT INTO `DEPART` VALUES( 107,'인사부','051-512-1007');

INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a101',2018,1,98100);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a102',2018,1,13600);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a103',2018,1,80100);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a104',2018,1,7800);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a105',2018,1,93000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a101',2018,2,23500);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a102',2018,2,126000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a103',2018,2,18500);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a105',2018,2,19000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a106',2018,2,53000);

INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a101',2019,1,24000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a102',2019,1,109000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a103',2019,1,101000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a104',2019,1,53500);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a107',2019,1,24000);

INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a102',2019,2,160000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a103',2019,2,101000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a104',2019,2,43000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a105',2019,2,24000);
INSERT INTO `SALE` (`uid`,`year`,`month`,`sales`) VALUES('a106',2019,2,109000);

# SELECT !!  WHERE, LIKE , IN
# Select FROM WHERE ORDER BY LIMIT 
SELECT *FROM `MEMBER` WHERE `name`='김유신';
SELECT *FROM `MEMBER` WHERE `name`!='김춘추';
SELECT *FROM `MEMBER` WHERE `name`<>'김유신';
SELECT *FROM `MEMBER` WHERE `pos`='사원' OR `pos`='대리';
SELECT *FROM `MEMBER` WHERE `pos`= IN ('사원','대리');

SELECT *FROM `MEMBER` WHERE `name`LIKE '%신';
SELECT *FROM `MEMBER` WHERE `name`LIKE '김%';
SELECT *FROM `MEMBER` WHERE `name`LIKE '_성_';
SELECT *FROM `SALE` WHERE `sales`>=5000 AND `sales`<10000 AND `month`=1;


# 정렬  ORDER BY,  LIMIT
SELECT *FROM `SALE` ORDER BY `sales`; 
SELECT *FROM `SALE` ORDER BY `sales` DESC; 
SELECT *FROM `MEMBER` ORDER BY `name`; 
SELECT *FROM `SALE` WHERE `sales`>=5000 ORDER BY `sales` DESC;
SELECT *FROM `SALE` WHERE `sales`>5000 ORDER BY `sales`DESC LIMIT 4, 5;  

# 내장함수 
SELECT SUM(`sales`) AS `합계` FROM `SALE`;
SELECT AVG(`sales`) AS `평균` FROM `SALE`;
SELECT MAX(`sales`) AS `최대값` FROM `SALE`;
SELECT MIN(`sales`) AS `최저값` FROM `SALE`;
SELECT COUNT(`sales`) AS `갯수` FROM `SALE`;
SELECT COUNT(*) 	AS `갯수` FROM `SALE`;
SELECT SUBSTRING(hp,10,4) AS `전화번호 끝자리` FROM `MEMBER`;

####
SELECT SUM(`sales`) AS `TOTAL` 
FROM `SALE`
WHERE `year`=2018 AND `month`=1 
##### RETURN ONLY ONE VALUE !! 

SELECT	`uid` 
		
		 AVG(`sales`) AS `AVG` 
 		 SUM(`sales`) AS `TOTAL2`
FROM `SALE`
WHERE `year`=2018;
GROUP BY `uid`

SELECT AVG(`sales`) AS `평균` 
		 SUM(`sales`) AS `총합`
*FROM `SALE`
WHERE `year`=2019 AND `month`=2 AND `sales`>=50000; 
