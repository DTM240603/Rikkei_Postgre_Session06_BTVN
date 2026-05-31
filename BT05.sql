CREATE SCHEMA bt05;
SET search_path TO bt05;

CREATE TABLE Course (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    instructor VARCHAR(50),
    price NUMERIC(10,2),
    duration INT
);

-- 1. Thêm ít nhất 6 khóa học vào bảng.
INSERT INTO Course (title, instructor, price, duration)
VALUES
    ('SQL Cơ Bản', 'Nguyễn Văn A', 700000.00, 20),
    ('PostgreSQL Nâng Cao', 'Trần Thị B', 1500000.00, 40),
    ('Java Spring Boot', 'Lê Minh Khoa', 2000000.00, 45),
    ('ReactJS Cho Người Mới', 'Phạm Hoàng Nam', 1200000.00, 30),
    ('Khóa Học Demo SQL', 'Võ Thu Hà', 500000.00, 15),
    ('NodeJS Backend', 'Đặng Quốc Cường', 1800000.00, 35);

-- 2. Tăng giá 15% cho các khóa học có thời lượng trên 30 giờ.
UPDATE Course
SET price = price * 1.15
WHERE duration > 30;

-- 3. Xóa khóa học có tên chứa từ “Demo”.
DELETE FROM Course
WHERE title ILIKE '%Demo%';

-- 4. Tìm khóa học có tên chứa từ “SQL”, không phân biệt hoa thường.
SELECT *
FROM Course
WHERE title ILIKE '%SQL%';

-- 5. Lấy 3 khóa học có giá từ 500.000 đến 2.000.000, sắp xếp giá giảm dần.
SELECT *
FROM Course
WHERE price BETWEEN 500000 AND 2000000
ORDER BY price DESC
LIMIT 3;