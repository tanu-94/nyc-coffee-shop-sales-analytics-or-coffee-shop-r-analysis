# ==============================================================================
# WEEK 1: DATA CLEANING & PREPROCESSING (FINAL CLEAN)
# ==============================================================================
library(readxl)
library(tidyverse)
library(lubridate)
library(fastDummies)
library(caret)

# 1. Ingestion
df <- read_excel("Coffee Shop Sales.xlsx", sheet = "Transactions")

# 2. Preprocessing & Feature Engineering
df_clean <- df %>%
  mutate(
    transaction_date = as.Date(transaction_date),
    # Extract hour directly from POSIXct
    transaction_hour = hour(transaction_time),
    day_of_week      = weekdays(transaction_date),
    month_name       = months(transaction_date),
    total_sales      = transaction_qty * unit_price,
    store_location   = as.factor(store_location),
    product_category = as.factor(product_category),
    product_type     = as.factor(product_type)
  )

# 3. Outlier Capping (Tukey's IQR Winsorization)
cap_iqr <- function(x) {
  q <- quantile(x, probs = c(0.25, 0.75), na.rm = TRUE)
  iqr_val <- q[2] - q[1]
  pmax(pmin(x, q[2] + 1.5 * iqr_val), max(0, q[1] - 1.5 * iqr_val))
}

df_clean$unit_price_capped  <- cap_iqr(df_clean$unit_price)
df_clean$total_sales_capped <- cap_iqr(df_clean$total_sales)

# 4. Dummy Encoding & Feature Scaling
df_encoded <- dummy_cols(
  df_clean, 
  select_columns = c("store_location", "product_category"), 
  remove_first_dummy = TRUE, 
  remove_selected_columns = FALSE
)

numeric_cols <- c("unit_price_capped", "total_sales_capped", "transaction_hour")
scale_params <- preProcess(df_clean[, numeric_cols], method = c("center", "scale"))
df_scaled    <- predict(scale_params, df_clean[, numeric_cols])

# Save clean dataframe for Weeks 2-4
saveRDS(df_clean, "coffee_clean.rds")

# ==============================================================================
# VERIFIED OUTPUT CHECKS
# ==============================================================================
print("--- 1. DATA AUDIT SUMMARY ---")
cat("Dimensions:", nrow(df_clean), "rows x", ncol(df_clean), "columns\n")
cat("Total Missing Values:", sum(is.na(df_clean)), "\n")

print("--- 2. OUTLIER TREATMENT COMPARISON ---")
rbind(
  "Original Unit Price" = summary(df_clean$unit_price),
  "Capped Unit Price"   = summary(df_clean$unit_price_capped),
  "Original Total Sales"= summary(df_clean$total_sales),
  "Capped Total Sales"  = summary(df_clean$total_sales_capped)
)

print("--- 3. STANDARDIZED VARIABLES (Mean ~ 0, SD ~ 1) ---")
sapply(df_scaled, function(x) c(Mean = round(mean(x), 4), SD = round(sd(x), 4), Min = round(min(x), 2), Max = round(max(x), 2)))


# ==============================================================================
# WEEK 1: SAVE HIGH-RES PLOTS FOR WORD REPORT
# ==============================================================================
library(ggplot2)
library(gridExtra)

df_clean <- readRDS("coffee_clean.rds")

# Plot 1: Outlier Treatment Comparison Boxplot
p1 <- ggplot(df_clean, aes(y = unit_price)) +
  geom_boxplot(fill = "#93C5FD", outlier.color = "red", alpha = 0.7) +
  labs(title = "A: Raw Unit Price (Outliers in Red)", y = "Price ($)") +
  theme_minimal()

p2 <- ggplot(df_clean, aes(y = unit_price_capped)) +
  geom_boxplot(fill = "#6EE7B7", alpha = 0.7) +
  labs(title = "B: Winsorized Unit Price (Capped at $5.63)", y = "Price ($)") +
  theme_minimal()

# Save Outlier Plot
png("Week1_Outlier_Comparison.png", width = 1800, height = 900, res = 300)
grid.arrange(p1, p2, ncol = 2)
dev.off()

# Plot 2: Total Sales Distribution
png("Week1_Sales_Distribution.png", width = 1800, height = 900, res = 300)
ggplot(df_clean, aes(x = total_sales_capped)) +
  geom_histogram(binwidth = 0.75, fill = "#3B82F6", color = "white", alpha = 0.85) +
  geom_vline(aes(xintercept = mean(total_sales_capped)), color = "red", linetype = "dashed", size = 1) +
  labs(
    title = "Distribution of Transaction Sales Values (Winsorized)",
    subtitle = "Dashed line indicates mean sales value ($4.49)",
    x = "Total Sales ($)",
    y = "Transaction Frequency"
  ) +
  theme_minimal()
dev.off()

cat("Week 1 plots saved to project directory successfully!\n")

library(tidyverse)
library(gridExtra)

df_clean <- readRDS("coffee_clean.rds")

# 1. Build Individual Boxplots
p1 <- ggplot(df_clean, aes(y = unit_price)) +
  geom_boxplot(fill = "#93C5FD", outlier.color = "red", outlier.size = 1.5, alpha = 0.8) +
  theme_minimal(base_size = 12) +
  labs(title = "A: Raw Unit Price (Outliers in Red)", y = "Price ($)")

p2 <- ggplot(df_clean, aes(y = unit_price_capped)) +
  geom_boxplot(fill = "#6EE7B7", alpha = 0.8) +
  theme_minimal(base_size = 12) +
  labs(title = "B: Winsorized Unit Price (Capped at $5.63)", y = "Price ($)")

# 2. Combine and Save via ggsave (100% reliable)
combined_plot <- arrangeGrob(p1, p2, ncol = 2)
ggsave("Week1_Outlier_Comparison.png", plot = combined_plot, width = 8, height = 4.5, dpi = 300)

cat("Week1_Outlier_Comparison.png successfully generated!\n")