REM   Script: Create Tables Session
REM   Create Tables Session

CREATE TABLE USERS ( 
    user_id INT NOT NULL PRIMARY KEY, 
    username varchar(30) NOT NULL UNIQUE, 
    password varchar(30) NOT NULL, 
    reg_date DATE, 
    type VARCHAR(30) NOT NULL, 
    birthday DATE, 
    phone_number VARCHAR(20), 
    last_name VARCHAR(20) NOT NULL, 
    first_name VARCHAR(20) NOT NULL 
);

CREATE TABLE CATEGORIES ( 
    category_id INT NOT NULL PRIMARY KEY, 
    admin_id INT NOT NULL, 
    category_name VARCHAR(20) NOT NULL, 
    FOREIGN KEY (admin_id) REFERENCES USERS(user_id) 
);

CREATE TABLE PRODUCTS ( 
    product_id INT NOT NULL PRIMARY KEY, 
    category_id INT NOT NULL, 
    colab_id INT NOT NULL, 
    product_name VARCHAR(30) NOT NULL, 
    product_price NUMERIC(4,2) NOT NULL, 
    product_desc VARCHAR(255), 
    product_stock INT, 
    FOREIGN KEY (category_id) REFERENCES CATEGORIES(category_id), 
    FOREIGN KEY (colab_id) REFERENCES USERS(user_id) 
);

CREATE TABLE COMMENTS( 
    comment_id INT NOT NULL PRIMARY KEY, 
    user_id INT NOT NULL, 
    product_id INT NOT NULL, 
    content VARCHAR(255), 
    rating INT NOT NULL, 
    FOREIGN KEY (user_id) REFERENCES USERS(user_id), 
    FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id) 
);

CREATE TABLE ORDERS( 
    order_id INT NOT NULL PRIMARY KEY, 
    user_id INT NOT NULL, 
    order_date DATE NOT NULL, 
    payment_type VARCHAR(20) NOT NULL, 
    delivery_adress VARCHAR(255), 
    delivery_date DATE, 
    delivery_state VARCHAR(100), 
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) 
);

CREATE TABLE CART_ITEMS( 
    user_id INT NOT NULL, 
    product_id INT NOT NULL, 
    order_id INT, 
    quantity INT NOT NULL, 
    FOREIGN KEY (user_id) REFERENCES USERS(user_id), 
    FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id), 
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id) 
);

