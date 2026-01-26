use application;
select * from customers;


CREATE USER 'pandas_user'@'localhost' IDENTIFIED BY 'pandas123';

GRANT ALL PRIVILEGES ON application.* TO 'pandas_user'@'localhost';

FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON application.* 
TO 'pandas_user'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'pandas_user'@'localhost';

-- Run this first for connection building otherwise they will thorw the error 

