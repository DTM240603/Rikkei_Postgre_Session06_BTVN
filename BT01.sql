CREATE SCHEMA bt01;
SET search_path TO bt01;

CREATE TABLE Product(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2),
    stock INT
);
-- 1. Thêm 5 sản phẩm vào bảng bằng lệnh INSERT
INSERT INTO Product(name, category, price, stock)
VALUES ('Laptop Dell', 'Điện tử', 22_000_000, 100),
       ('Laptop Asus', 'Điện tử', 30_000_000, 120),
       ('Quần thể thao', 'Quần áo', 300_000, 500),
       ('Áo thể thao', 'Quần áo', 250_000, 600),
       ('Điện thoại Samsung', 'Điện tử', 7_000_000, 100);

-- 2. Hiển thị danh sách toàn bộ sản phẩm
SELECT *
FROM Product;

-- 3. Hiển thị 3 sản phẩm có giá cao nhất
SELECT *
FROM Product
ORDER BY price DESC
LIMIT 3;

-- 4. Hiển thị các sản phẩm thuộc danh mục “Điện tử” có giá nhỏ hơn 10,000,000
SELECT *
FROM Product
WHERE category = 'Điện tử' AND price < 10_000_000;

-- 5. Sắp xếp sản phẩm theo số lượng tồn kho tăng dần
SELECT *
FROM Product
ORDER BY stock ASC;