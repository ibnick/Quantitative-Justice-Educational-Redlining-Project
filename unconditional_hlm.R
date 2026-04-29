
library(readxl)
Final_Merged_2024_K12_Updated <- read_excel("S:/Ibrahim/UConn Spencer Project Analysis Delaware Data/Final_Merged_2024_K12_Updated.xlsx")

library(lme4)
library(performance)

unconditional_hlm <- glmer (
  is_sped ~ 1 + (1|Schl),
  data = Final_Merged_2024_K12_Updated,
  family = binomial(link = "logit")
)

summary(unconditional_hlm)
icc(unconditional_hlm)

# 1. Save the entire model object to your working directory
saveRDS(unconditional_hlm, "unconditional_hlm_2024_K12.rds")

# 2. Confirmation message
cat("Model object successfully saved as 'unconditional_hlm_2024_K12.rds'.")