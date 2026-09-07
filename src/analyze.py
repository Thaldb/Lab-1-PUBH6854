from pathlib import Path

import pandas as pd


data_path = Path(__file__).resolve().parents[1] / "data" / "patients.csv"
patients = pd.read_csv(data_path)
site_counts = patients["site"].value_counts()

print("Patient Summary")
print(f"patient_count: {len(patients)}")
print(f"mean_age: {patients['age'].mean():.1f}")
print(f"minimum_age: {patients['age'].min()}")
print(f"maximum_age: {patients['age'].max()}")
print(f"site_DC: {site_counts.get('DC', 0)}")
print(f"site_MD: {site_counts.get('MD', 0)}")
print(f"site_VA: {site_counts.get('VA', 0)}")
