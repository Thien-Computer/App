CREATE TABLE account (
	username VARCHAR (20),
    pass VARCHAR (20)
);

INSERT INTO `account` VALUES ('sManager', 'password');

CREATE USER 'sManager'@'localhost' IDENTIFIED BY 'password';
GRANT ALL ON ass2.* TO 'sManager'@'localhost';