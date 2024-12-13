USE COMPANY;

/*---DDL---*/

create table Car(
CAR_ID INT primary key,
CAR_NAME VARCHAR(50) default 'honda',
ASSIGN_DATE date default getdate(),
EMP_ID INT,
)
Alter table Car alter column CAR_NAME VARCHAR(60);
Alter table Car  add status VARCHAR(60);
Alter table CAR ADD CONSTRAINT STATUS DEFAULT 'avaible'for STATUS;
/*DML*/
INSERT INTO CAR(CAR_ID,EMP_ID)
values(3,20);
UPDATE CAR
	SET STATUS=NULL
delete from CAR
	where CAR_ID=3;
SELECT * FROM CAR;

