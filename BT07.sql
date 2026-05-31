CREATE SCHEMA bt07;
SET search_path TO bt07;

CREATE TABLE Department (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Employee (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    department_id INT,
    salary NUMERIC(10,2),
    FOREIGN KEY (department_id) REFERENCES Department(id)
);

-- Thêm dữ liệu vào bảng Department
INSERT INTO Department (name)
VALUES
    ('IT'),
    ('Kế toán'),
    ('Nhân sự'),
    ('Marketing'),
    ('Kinh doanh');

-- Thêm dữ liệu vào bảng Employee
INSERT INTO Employee (full_name, department_id, salary)
VALUES
    ('Nguyễn Văn An', 1, 15000000.00),
    ('Trần Thị Bình', 1, 18000000.00),
    ('Lê Minh Khoa', 2, 9000000.00),
    ('Phạm Hoàng Nam', 2, 11000000.00),
    ('Võ Thu Hà', 3, 8000000.00),
    ('Đặng Quốc Cường', 4, 14000000.00);

-- 1. Liệt kê danh sách nhân viên cùng tên phòng ban của họ (INNER JOIN)
SELECT
    e.full_name AS "Tên nhân viên",
    d.name AS "Phòng ban"
FROM Employee e
JOIN Department d ON e.department_id = d.id;

-- 2. Tính lương trung bình của từng phòng ban, hiển thị:
-- department_name
-- avg_salary
-- Gợi ý: dùng GROUP BY và bí danh cột
SELECT
    d.name AS "Phòng ban",
    AVG(e.salary) "Lương trung bình"
FROM Employee e
JOIN Department d ON e.department_id = d.id
GROUP BY "Phòng ban";

-- 3. Hiển thị các phòng ban có lương trung bình > 10 triệu (HAVING)
SELECT
    d.name AS "Phòng ban",
    AVG(e.salary) "Lương trung bình"
FROM Employee e
         JOIN Department d ON e.department_id = d.id
GROUP BY "Phòng ban"
HAVING AVG(e.salary) > 10000000;

-- 4. Liệt kê phòng ban không có nhân viên nào (LEFT JOIN + WHERE employee.id IS NULL)
SELECT
    d.name AS "Phòng ban"
FROM Department d
LEFT JOIN Employee e ON e.department_id = d.id
WHERE e.id IS NULL;


