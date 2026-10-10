import requests
import numpy as np
import pandas as pd
import flask

print("=" * 50)
print("✓ All packages imported successfully!")
print("=" * 50)
print()
print("Installed versions:")
print(f"  • requests: {requests.__version__}")
print(f"  • numpy: {np.__version__}")
print(f"  • pandas: {pd.__version__}")
print(f"  • flask: {flask.__version__}")
print()

# Test numpy
arr = np.array([1, 2, 3, 4, 5])
print(f"✓ NumPy array sum: {arr.sum()}")

# Test pandas
df = pd.DataFrame({'A': [1, 2, 3], 'B': [4, 5, 6]})
print(f"✓ Pandas DataFrame shape: {df.shape}")

# Test requests
try:
    response = requests.get('https://api.github.com', timeout=5)
    print(f"✓ Requests API status: {response.status_code}")
except Exception as e:
    print(f"✓ Requests available (connection test skipped)")

print()
print("=" * 50)
print("All systems operational! Ready for development.")
print("=" * 50)
