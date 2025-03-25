-- 사용자 테이블 생성
CREATE TABLE users (
   user_id INT PRIMARY KEY AUTO_INCREMENT,
   username VARCHAR(255) UNIQUE NOT NULL,
   email VARCHAR(255) UNIQUE NOT NULL,
   age INT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 상품 테이블 생성
CREATE TABLE products (
	  product_id INT PRIMARY KEY AUTO_INCREMENT,
	  product_name VARCHAR(255) NOT NULL,
	  price DECIMAL(10, 2) NOT NULL,
	  category VARCHAR(255),
	  stock INT DEFAULT 0
);

-- 주문 테이블 생성
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    quantity INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 리뷰 테이블 생성
CREATE TABLE reviews (
	   review_id INT PRIMARY KEY AUTO_INCREMENT,
	   user_id INT,
	   product_id INT,
	   rating INT,
	   comment TEXT,
	   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	   FOREIGN KEY (user_id) REFERENCES users(user_id),
	   FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 사용자 데이터 삽입
INSERT INTO users (username, email, age) VALUES
   ('JohnDoe', 'john@example.com', 30),
   ('JaneSmith', 'jane@example.com', 25),
   ('DavidLee', 'david@example.com', 40),
   ('SarahKim', 'sarah@example.com', 28);

-- 상품 데이터 삽입
INSERT INTO products (product_name, price, category, stock) VALUES
	  ('Laptop', 1200.00, 'Electronics', 10),
	  ('Smartphone', 800.00, 'Electronics', 20),
	  ('T-shirt', 25.00, 'Clothing', 50),
	  ('Jeans', 60.00, 'Clothing', 30),
	  ('Book', 15.00, 'Books', 100);

-- 주문 데이터 삽입
INSERT INTO orders (user_id, product_id, quantity) VALUES
   (1, 1, 1),
   (2, 2, 2),
   (1, 3, 3),
   (3, 4, 1),
   (4, 5, 2);

-- 리뷰 데이터 삽입
INSERT INTO reviews (user_id, product_id, rating, comment) VALUES
   (1, 1, 5, 'Excellent product!'),
   (2, 2, 4, 'Good value for money.'),
   (1, 3, 3, 'Average quality.'),
   (3, 4, 5, 'Perfect fit!'),
   (4, 5, 4, 'Interesting book.');