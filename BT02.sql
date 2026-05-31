CREATE SCHEMA bt02;
SET search_path TO bt02;

CREATE TABLE Employee(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2),
    hire_date DATE
);

-- 1. Thêm 6 nhân viên mới
INSERT INTO Employee (full_name, department, salary, hire_date)
VALUES
    ('Nguyễn Văn An', 'IT', 12000000.00, '2023-03-15'),
    ('Trần Thị Bình', 'HR', 5500000.00, '2022-11-10'),
    ('Lê Minh Khoa', 'IT', 15000000.00, '2024-01-05'),
    ('Phan Hoàng Nam', 'Marketing', 8000000.00, '2023-07-20'),
    ('Võ Thị Lan', 'Kế toán', 5800000.00, '2023-12-01'),
    ('Đặng Thu Hà', 'Sales', 9000000.00, '2021-09-12');

-- 2. Cập nhật mức lương tăng 10% cho nhân viên thuộc phòng IT
UPDATE Employee
SET salary = salary * 1.1
WHERE department = 'IT';

-- 3. Xóa nhân viên có mức lương dưới 6,000,000
DELETE FROM Employee
WHERE salary < 6000000;

-- 4. Liệt kê các nhân viên có tên chứa chữ “An” (không phân biệt hoa thường)
SELECT *
FROM Employee
WHERE full_name ILIKE '%An%';

-- 5. Hiển thị các nhân viên có ngày vào làm việc trong khoảng từ '2023-01-01' đến '2023-12-31'
SELECT *
FROM Employee
WHERE hire_date BETWEEN '2023-01-01' AND '2023-12-31';