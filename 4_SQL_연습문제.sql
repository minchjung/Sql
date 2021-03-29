#날짜 : 2021/03/26
#이름 : Minchan
#내용 : SQL 연습문제 21,22 Count 예제 !! <---retry 

#실습1
CREATE TABLE `Book` (
	`bookid`		INT AUTO_INCREMENT PRIMARY KEY,
	`bookname`	VARCHAR(20),
	`publisher` VARCHAR(20),
	`price`		INT
);

#실습2
CREATE TABLE `Customer` (
	`custid`   INT AUTO_INCREMENT PRIMARY KEY,
	`name` 	  VARCHAR(20),
	`address`  VARCHAR(20),
	`phone` 	  CHAR(13)
);

#실습3
CREATE TABLE `Orders` (
	`orderid`		INT AUTO_INCREMENT PRIMARY KEY,
	`custid`			INT,
	`bookid`			INT,
	`saleprice`		INT,
	`orderdate`		DATE
);

#실습4
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (1,1,6000, '2014-07-01');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (1,3,21000, '2014-07-03');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (2,5,8000, '2014-07-03');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (3,6,6000, '2014-07-04');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (4,7,20000, '2014-07-05');									   
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (1,2,12000, '2014-07-07');									   
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (4,8,13000, '2014-07-07');									   
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (3,10,12000, '2014-07-08');									   
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (2,10,7000, '2014-07-09');									   
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`) VALUES (3,8,13000, '2014-07-10');									   

INSERT INTO `Book` (`bookname`, `publisher`, `price`) VALUES ('축구의 역사', '굿스포츠', 7000);
INSERT INTO `Book` (`bookname`, `publisher`, `price`) VALUES ('축구아는 여자', '나무수', 13000);
INSERT INTO `Book` (`bookname`, `publisher`, `price`) VALUES ('축구의 이해', '대한미디어', 22000);
INSERT INTO `Book` (`bookname`, `publisher`, `price`) VALUES ('골프 바이블', '대한미디어', 35000);
INSERT INTO `Book` (`bookname`, `publisher`, `price`) VALUES ('피겨교본', '굿스포츠', 8000);
INSERT INTO `Book` (`bookname`, `publisher`, `price`) VALUES ('역도 단계별기술', '굿스포츠', 6000);
INSERT INTO `Book` (`bookname`, `publisher`, `price`) VALUES ('야구의 추억', '이상미디어', 20000);
INSERT INTO `Book` (`bookname`, `publisher`, `price`) VALUES ('야구를 부탁해', '이상미디어', 13000);
INSERT INTO `Book` (`bookname`, `publisher`, `price`) VALUES ('올림픽 이야기', '삼성당', 7500);
INSERT INTO `Book` (`bookname`, `publisher`, `price`) VALUES ('Olympic Champions', 'Pearson', 13000);

INSERT INTO `Customer` (`name`, `address`, `phone`) VALUES ('박지성', '영국 맨체스터', '000-5000-0001');
INSERT INTO `Customer` (`name`, `address`, `phone`) VALUES ('김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO `Customer` (`name`, `address`, `phone`) VALUES ('장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO `Customer` (`name`, `address`, `phone`) VALUES ('추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO `Customer` (`name`, `address`) VALUES ('박세리', '대한민국 대전');


# 11 축구가 포함된 출판사 검색 
SELECT `publisher` FROM `Book` WHERE `bookname` LIKE'%축구%';
# 12 도서의 왼쪽 두 번째 위치에 `구`라는 문자열을 갖는 도서 검색 
SELECT * FROM `Book` WHERE `bookname` LIKE'%_구%';
#15 도서를 가격순으로 검색하고 가격이 같으면 이름순으로 검색 
SELECT * FROM `Book` ORDER BY `price`ASC, `bookname` ASC;
#16 도서를 가격의 내림차순으로 검색, 만약 가격이 같다면 출판사의 오름차순으로 검색 
SELECT * FROM `Book` ORDER BY `price`DESC, `publisher` ASC; 
#17 고객이 주문한 도서의 총판액을 구하라 
SELECT SUM(`saleprice`) AS `총판매액` FROM `Orders`; 
#20 도서 판매 건수를 구하라 
SELECT COUNT(*) AS `판매건수` FROM `Orders`;
#21 가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하라
# 단, 두 권 이상 구매한 고객만 ! 
SELECT `custid`, COUNT(*) AS `총수량` FROM `Orders` WHERE `saleprice`>=8000 GROUP BY `custid` HAVING `총수량`>=2; 
#22 고객과 고객의 주문에 관한 데이터를 모두 보이시오 
SELECT * FROM `Customer` AS a  JOIN `Orders` AS b ON a.`custid`=b.`custid`;
#25 고객별로 주문한 모든 도서의 총 팜ㄴ매액을 구하고, 고객별로 정렬 
SELECT a.`name`, SUM(b.`saleprice`) FROM `Customer` AS a JOIN `Orders` AS b ON a.`custid` =b.`custid`
GROUP BY a.`name` ORDER BY a.`name`;
#26고객의 이름과 고객이 주문한 도서의 이름을 구하시오 
SELECT a.`name`, c.`bookname` FROM `Customer` AS a JOIN `Orders` AS b ON a.`custid` = b.`custid` 
JOIN `Book` AS c ON b.`bookid`=c.`bookid` ;
#30 Book 테이블에 새로운 도서 `스포츠 의학`을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으면 가격은 미정이다. 
INSERT INTO `Book` (`publisher`,`bookname`)VALUES('한솔의학서적','스포츠 의학');
#31 Customer 테이블에서 고객번호가 5인 고객의 주소를 대한민국 부산으로 변경하시오 
UPDATE `Customer` SET `address`='대한민국 부산' WHERE`custid`=5;