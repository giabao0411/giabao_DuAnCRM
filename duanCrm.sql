
CREATE database crm_app;
USE crm_app;

drop database crm_app;

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    fullname VARCHAR(100) NOT NULL,
    phone INT NOT NULL,
    address VARCHAR(100),
    PRIMARY KEY (id)
);

drop table tasks;

CREATE TABLE IF NOT EXISTS status (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS jobs (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tasks (
    id INT NOT NULL AUTO_INCREMENT,
    taskname VARCHAR(50) NOT NULL,
    user_id INT NOT NULL,
    job_id INT NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE tasks ADD FOREIGN KEY (user_id) REFERENCES users (id)  ON DELETE CASCADE;
ALTER TABLE tasks ADD FOREIGN KEY (job_id) REFERENCES jobs (id)  ON DELETE CASCADE;
ALTER TABLE tasks ADD FOREIGN KEY (status_id) REFERENCES status (id)  ON DELETE CASCADE;

INSERT INTO status( name ) VALUES ("Chưa thực hiện");
INSERT INTO status( name ) VALUES ("Đang thực hiện");
INSERT INTO status( name ) VALUES ("Đã hoàn thành");

insert into users(email, password, fullname, phone, address) values ("nguyenvana@gmail.com", "123456", "Nguyễn Văn A", 0987654321, "Huỳnh Văn Bánh, p12, quận 3");
insert into users(email, password, fullname, phone, address) values ("nguyenthib@gmail.com", "b12345", "Nguyễn Thị B", 0987123456, "Trường Sơn, p9, quận Bình Thạnh");
insert into users(email, password, fullname, phone, address) values ("nguyenvanc@gmail.com", "123456", "Nguyễn Văn C", 0982345671, "Lê Thị Hồng, p7, quận Gò Vấp");
insert into users(email, password, fullname, phone, address) values ("nguyenvand@gmail.com", "d12345", "Nguyễn Văn D", 0912345678, "Sư Vạn Hạnh, p11, quận 10");
insert into users(email, password, fullname, phone, address) values ("nguyenthiv@gmail.com", "123456", "Nguyễn Thị V", 0987654321, "Hai Bà Chưng, p3, quận 3");

insert into tasks(taskname, user_id, job_id) values ("Project Analysis", 1, 2);

select t.id, t.taskname, t.job_id, j.name, t.user_id, u.fullname from tasks t
join users u on t.user_id = u.id
join jobs j on t.job_id = j.id


-- DELIMITER //
-- CREATE PROCEDURE GetTaskByUserAndJob()
-- BEGIN
-- 	select t.taskname, j.name, u.fullname, j.start_date, j.end_date from tasks t
-- 	join users u on t.user_id = u.id
-- 	join jobs j on t.job_id = j.id;
-- END //
-- DELIMITER ;

-- DROP PROCEDURE  GetPhimByQuocGia;
-- call GetTaskByUserAndJob();