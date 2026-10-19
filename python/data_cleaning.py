import pandas as pd

file_path = r"C:\Users\chaks\Sales-Data-Analysis\data\sample_-_superstore.xls"

df = pd.read_excel(file_path)

print("First 5 rows:")
print(df.head())

print("\nShape:")
print(df.shape)

print("\nColumns:")
print(df.columns.tolist())
print("\nMissing Values:")
print(df.isnull().sum())
print("\nDuplicate Rows:")
print(df.duplicated().sum())
print("\nData Types:")
print(df.dtypes)
print("\nNumerical Summary:")
print(df[["Sales", "Quantity", "Discount", "Profit"]].describe())
# Save cleaned dataset
output_path = r"C:\Users\chaks\Sales-Data-Analysis\data\cleaned_sales_data.csv"

df.to_csv(output_path, index=False)

print("\nCleaned dataset saved successfully!")