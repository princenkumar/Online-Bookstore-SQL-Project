-- CREATE DATABASE 
CREATE DATABASE OnlineBookstore;

CREATE TABLE Books(
		Book_ID INT PRIMARY KEY,
		Title VARCHAR (100),
		Author VARCHAR(100),
		Genre VARCHAR (50),
		Published_Year INT,
		Price NUMERIC(10,2),
		Stock INT
);
	CREATE TABLE Customers(
		Customer_ID INT PRIMARY KEY,
		Name VARCHAR(100),
		Email VARCHAR(100),
		Phone VARCHAR (15),
		City VARCHAR(100),
 		Country VARCHAR (100)


	);

		CREATE TABLE Orders(
		Order_ID INT PRIMARY KEY,
		Customer_ID INT REFERENCES Customers(Customer_ID),
		Book_ID INT REFERENCES Books (Book_ID),
		Order_Date DATE,
		Quantity INT,
		Total_Amount NUMERIC (10,2)
		);

		SELECT * FROM Books;
		SELECT * FROM Customers;
		SELECT * FROM orders;
			-- Import Data Into book table
			COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price,Stock)
			FROM 'D:\Ms Office\DATA-ANYLIST\SQL\SQL ALL FILES\All Excel Practice Files\Books.csv'
			CSV HEADER;

			-- Import Data Into Customers Table 
				COPY Customers(Customer_ID, Name, Email, Phone, City, Country)
				FROM 'D:\Ms Office\DATA-ANYLIST\SQL\SQL ALL FILES\All Excel Practice Files\Customers.csv'
				CSV HEADER;

				-- Import Data Into Orders Table 
				COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
				FROM 'D:\Ms Office\DATA-ANYLIST\SQL\SQL ALL FILES\All Excel Practice Files\Orders.csv'
				CSV HEADER;


				SELECT * FROM Books;
				SELECT * FROM Customers;
				SELECT * FROM Orders;

		--1) Retrieve all books in the "Fiction" genre

		SELECT * FROM Books
		WHERE genre='Fiction'

		 -- 2) Find books published after the year 1950

		 SELECT *  FROM Books
		 WHERE published_year>1950;

		  -- 3) List all customers from the Canada
		  SELECT *  FROM Customers
		  WHERE country='Canada'

		  -- 4) Show orders placed in November 2023

			  SELECT * FROM Orders
			  WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

			  -- 5) Retrieve the total stock of books available
			  	 SELECT SUM(stock) AS STOCK_BOOKS
				   FROM Books;

				    -- 6) Find the details of the most expensive book
					SELECT * FROM Books
					ORDER BY Price DESC
					LIMIT 1;

					-- 7) Show all customers who ordered more than 1 quantity of a book
					SELECT * FROM Orders
					WHERE quantity >1;

				  -- Retrieve all orders where the total amount exceeds $20
				  	SELECT *
					  FROM Orders
					  WHERE total_amount > 20

					 -- 9) List all genres available in the Books table

							 SELECT  DISTINCT genre FROM Books;

						-- 10) Find the book with the lowest stock

							SELECT * FROM Books
							ORDER BY stock ASC
							LIMIT ;

						 -- 11) Calculate the total revenue generated from all orders

						 SELECT SUM(total_amount) as Revenue
						 FROM Orders 
						

			-- Advance Question						 

					 	-- 1) Retrieve the total number of books sold for each genre

						 SELECT * FROM Orders

						 SELECT b.genre ,SUM(o.Quantity) AS Total_Book_Sold
						 FROM Orders o
						 join Books b ON b.book_id=o.book_id
						 GROUP BY b.genre;
						 

					 -- 2) Find the average price of books in the "Fantasy" genre

							 SELECT AVG (price) AS Avrage_price
							 FROM Books
							 WHERE genre='Fantasy';
							 

							 -- 3) List customers who have placed at least 2 orders
							 SELECT c.name,o.customer_id,COUNT(o.Order_id) AS Order_Count
							 FROM Orders o
							 JOIN Customers c 
							 ON o.customer_id=c.customer_id
							  GROUP BY o.customer_id ,c.name
								 HAVING COUNT(Order_id) >=2;

								---4) Find most Frequentitly Orders Book;

								SELECT o.book_id,b.title,COUNT(o.order_id) AS Order_Books
								FROM Orders o
								JOIN Books b
								ON b.book_id=o.book_id
								GROUP BY b.title ,o.book_id
								ORDER BY Order_Books DESC LIMIT 1;

							  --5) Show the top 3 most expensive books of 'Fantasy' Genre 
							  	SELECT * FROM Books
								  WHERE genre = 'Fantasy'
								  ORDER BY price DESC
								  LIMIT 3;

								  --6) Retrieve the total quantity of books sold by each author
								  SELECT b.author, SUM (o.quantity) AS Total_Quantity_and_author
								  FROM  Orders o
								 	JOIN Books b
									 ON o.book_id= b.book_id
									 GROUP BY b.author;


							--7) List the cities where customers who spent over $30 are located


								SELECT DISTINCT b.city,O.total_amount
								FROM Orders o
								JOIN customers b
								ON o.customer_id=b.customer_id
								WHERE o.total_amount>30;

						 -- 8) Find the customer who spent the most on orders
						 		SELECT c.customer_id,c.name, SUM (o.total_amount) AS spent_amount
								 FROM Orders o
								 JOIN Customers c
								 ON o.customer_id=c.customer_id
								 GROUP BY c.name,c.customer_id
								 ORDER BY spent_amount DESC LIMIT 1;


				 -- 9) Calculate the stock remaining after fulfilling all orders

						SELECT b.book_id,b.title,b.stock, COALESCE(SUM(quantity),0) AS Order_Quentity,
						b.stock-COALESCE(SUM(quantity),0)
						 FROM Books b
						 LEFT JOIN  Orders o
						 ON b.book_id=o.book_id
						 GROUP BY b.book_id
						 ORDER BY b.book_id;
				 

							 

				
				SELECT * FROM Books;
				SELECT * FROM Customers;
				SELECT * FROM Orders;
				