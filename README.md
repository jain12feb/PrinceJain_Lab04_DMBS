# Problem Statement**

You are part of a team which is involved in developing an E-Commerce Website. The E-commerce website manages its data in the Database..

1) You are required to create tables for **supplier, customer, category, product, supplier\_pricing, order, rating** to store the data for the E-commerce with the schema definition given below.
1) You are required to develop SQL based programs (Queries) to facilitate the Admin team of the E-Commerce company to retrieve the data in summarized format.

### Table: Supplier Columns:

|**SUPP\_ID**|INT PK|
| - | - |
|SUPP\_NAME|varchar(50) NOT NULL|
|SUPP\_CITY|varchar(50) NOT NULL|
|SUPP\_PHONE|varchar(50) NOT NULL|

### Table: Customer Columns:

|**CUS\_ID**|INT PK|
| - | - |
|CUS\_NAME|VARCHAR(20) NOT NULL|
|CUS\_PHONE|VARCHAR(10) NOT NULL|
|CUS\_CITY|VARCHAR(30) NOT NULL|
|CUS\_GENDER|CHAR|

### Table: Category Columns:

|**CAT\_ID**|INT PK|
| - | - |
|CAT\_NAME|VARCHAR(20) NOT NULL|

### Table: Product Columns:

|**PRO\_ID**|INT PK|
| - | - |
|PRO\_NAME|VARCHAR(20) NOT NULL DEFAULT "Dummy"|
|PRO\_DESC|VARCHAR(60)|
|**CAT\_ID**|INT FK|

### Table: Supplier\_pricing Columns:

|**PRICING\_ID**|INT PK|
| - | - |
|**PRO\_ID**|INT FK|
|**SUPP\_ID**|INT FK|
|SUPP\_PRICE|INT DEFAULT 0|

### Table: Order Columns:

|ORD\_ID|INT PK|
| - | - |
|ORD\_AMOUNT|<p>INT</p><p>NOT NULL</p>|
|ORD\_DATE|DATE NOT NULL|
|**CUS\_ID**|INT FK|
|**PRICING\_ID**|INT FK|

### Table: Rating

**Columns: (Rating provided in this table is common for product and supplier)**

|**RAT\_ID**|INT PK|
| - | - |
|**ORD\_ID**|INT FK|
|RAT\_RATSTARS|INT NOT NULL|

![lab04_dbms_schema_relationships](https://github.com/jain12feb/PrinceJain_Lab04_DMBS/assets/26286421/bab9dffe-273f-45cd-bbcc-a06334c7753a)

## Learning Objectives: 

After completing this project,

Learner will be able to Understand the Database Schemas for a Business Org and will be able to design the database and corresponding tables that are needed for an e-Commerce WebSite.

Also Learner will be able to design SQL queries to retrieve data involving the following features of MySQL:

1) Select Queries (with logical & comparison operators)
2) Group By / Order By / Having Clauses
2) Joins
2) Sub Queries
2) Procedures (Creating & Executing )
2) Use case construct in a procedure.


