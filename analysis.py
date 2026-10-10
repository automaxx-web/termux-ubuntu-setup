import pandas as pd
import numpy as np

# Create sample data
data = {'Name': ['Alice', 'Bob', 'Charlie'], 'Score': [85, 90, 78]}
df = pd.DataFrame(data)
print(df)
print(f"Average score: {df['Score'].mean()}")
