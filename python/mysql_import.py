import mysql.connector
import pandas as pd

# CSV file
file_path = "data/cleaned_sales_data.csv"

# Read cleaned CSV
df = pd.read_csv(file_path)

print("CSV loaded successfully!")
print("Rows:", len(df))

# Connect to MySQL
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="chakshu@14",
    database="sales_analysis"
)

cursor = connection.cursor()

# Insert data
insert_query = """
INSERT INTO sales (
    `Row ID`, `Order ID`, `Order Date`, `Ship Date`, `Ship Mode`,
    `Customer ID`, `Customer Name`, `Segment`, `Country/Region`,
    `City`, `State/Province`, `Postal Code`, `Region`, `Product ID`,
    `Category`, `Sub-Category`, `Product Name`, `Sales`, `Quantity`,
    `Discount`, `Profit`
)
VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
"""

# Convert NaN values to None
df = df.where(pd.notnull(df), None)

# Insert rows
for row in df.itertuples(index=False, name=None):
    cursor.execute(insert_query, row)

connection.commit()

print("Data imported successfully!")
print("Rows inserted:", cursor.rowcount)

cursor.close()
connection.close()