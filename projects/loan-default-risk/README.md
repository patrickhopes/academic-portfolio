# Loan Default Risk Assessment

This capstone workbook turns a fitted logistic regression model into an Excel demonstration of credit risk assessment. A reader can enter an applicant profile, inspect the estimated default probability, and trace the result to the coefficients and calculations.

## File

[loan-default-capstone.xlsx](loan-default-capstone.xlsx) is the original supplied workbook, with its content preserved.

## Workbook structure

| Worksheet | Role |
| --- | --- |
| ReadMe | Overview, usage, model method, and scope |
| Input | Applicant, loan, and financial inputs |
| Results Dashboard | Estimated probability, risk classification, decision prompt, and indicators |
| Coefficients | Imported logistic regression coefficients and variable notes |
| Calculations | Encoding, coefficient application, logistic conversion, and risk tier |

The ReadMe documents SQL data checks, model fitting in R, and the transfer of model coefficients into Excel. The public loan dataset, SQL checks, and R training code were not attached, so this folder contains the scoring implementation rather than the entire training pipeline.

## Open and explore

Download the workbook and open it in Excel. Start with the ReadMe, change the values on Input, and inspect Results Dashboard. The Coefficients and Calculations sheets show how the score is built.

## Scope and known items to review

This is an academic demonstration, rather than a validated lending tool. The supplied risk tiers, decision prompts, and confidence labels do not establish model accuracy, calibrated uncertainty, fairness, or appropriate policy for actual borrowers.

The original workbook includes an education-category match using `HighSchool` while the input option is `High School`, and DTI labels that mix percentage wording with a ratio-style input. Review those items before extending or relying on the demonstration. The workbook has not been repaired or recalculated as part of creating the portfolio.
