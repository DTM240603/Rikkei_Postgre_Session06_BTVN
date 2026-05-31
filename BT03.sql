CREATE SCHEMA bt03;
SET search_path TO bt03;

CREATE TABLE Customer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    points INT
);

-- 1. Thêm 7 khách hàng, trong đó có 1 người không có email.
INSERT INTO Customer (name, email, phone, points)
VALUES
    ('Nguyễn Văn An', 'an@gmail.com', '0912345678', 120),
    ('Trần Thị Bình', 'binh@gmail.com', '0923456789', 250),
    ('Lê Minh Khoa', 'khoa@gmail.com', '0934567890', 180),
    ('Phạm Hoàng Nam', 'nam@gmail.com', '0945678901', 320),
    ('Nguyễn Văn An', 'an2@gmail.com', '0956789012', 150),
    ('Võ Thu Hà', NULL, '0967890123', 90),
    ('Đặng Quốc Cường', 'cuong@gmail.com', '0978901234', 280);

-- 2. Truy vấn danh sách tên khách hàng duy nhất bằng DISTINCT.
SELECT DISTINCT name
FROM Customer;

-- 3. Tìm khách hàng chưa có email bằng IS NULL.
SELECT *
FROM Customer
WHERE email IS NULL;

-- 4. Hiển thị 3 khách hàng có điểm thưởng cao nhất, nhưng bỏ qua người có điểm cao nhất bằng OFFSET.
SELECT *
FROM Customer
ORDER BY points DESC
LIMIT 3 OFFSET 1;

-- 5. Sắp xếp danh sách khách hàng theo tên giảm dần.
SELECT *
FROM Customer
ORDER BY name DESC;