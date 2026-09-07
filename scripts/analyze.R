patients <- read.csv(file.path("data", "patients.csv"))

summary_values <- dplyr::summarise(
  patients,
  patient_count = dplyr::n(),
  mean_age = mean(age),
  minimum_age = min(age),
  maximum_age = max(age)
)

cat("Patient Summary\n")
cat(sprintf("patient_count: %d\n", summary_values$patient_count))
cat(sprintf("mean_age: %.1f\n", summary_values$mean_age))
cat(sprintf("minimum_age: %d\n", summary_values$minimum_age))
cat(sprintf("maximum_age: %d\n", summary_values$maximum_age))
cat(sprintf("site_DC: %d\n", sum(patients$site == "DC")))
cat(sprintf("site_MD: %d\n", sum(patients$site == "MD")))
cat(sprintf("site_VA: %d\n", sum(patients$site == "VA")))
