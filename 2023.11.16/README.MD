### Database Scenario:
- **Database Name:** `ComputerStore`
- **Tables:**
  1. **Products:** Stores information about computers for sale.
     - Columns: name, description, price, stock_quantity, category (e.g., laptop, desktop, tablet)
  2. **Customers:** Stores information about customers.
     - Columns: full_name, email, address
  3. **Orders:** Stores information about customer orders.
     - Columns: customer_id (foreign key), order_date, total_amount
  4. **OrderDetails:** Stores details about what products are in each order.
     - Columns: order_id (foreign key), product_id (foreign key), quantity, price

### Assignment Tasks:

#### 4. **INSERT INTO Query:**
   - Insert a new order into the Orders table and corresponding details into the OrderDetails table.

#### 1. **SELECT Queries:**
   - Retrieve all products in the 'Laptop' category that are priced above $1000.
   - List the names and email addresses of customers who have placed more than 3 orders.
   - Retrieve the names of all products that are out of stock.
   - List the details of orders placed in the last 30 days.

#### 2. **UPDATE Query:**
   - Update the stock quantity of a specific product after a new shipment arrives.

#### 3. **DELETE Query:**
   - Delete all products that have been discontinued and are no longer in stock.

#### 17. **Date and Time Functions:**
   - List all orders placed on weekends.
   - Display products added to the store in the last six months.

#### 13. **Using DISTINCT and ORDER BY:**
   - Display a list of unique customer addresses.
   - List the top 10 most expensive products, sorted by price in descending order.

#### 14. **Using LIKE for Pattern Matching:**
   - Select product names that contain the word 'Gaming'.
   - Find customer names that start with the letter 'J'.

#### 7. **Aggregate Functions and GROUP BY:**
   - Determine the average price of products in each category.
   - Count the total number of orders placed each month.
   - Find the most expensive product in each category.
   - Calculate the total revenue generated from the 'Desktop' category.


#### 6. **Complex SELECT Queries with JOINs:**
   - Find the total amount spent by each customer on orders.
   - List all products that have never been ordered.
   - Retrieve the full details of all orders along with customer names and product names.
   - List customers who have never ordered a 'Tablet' category product.

