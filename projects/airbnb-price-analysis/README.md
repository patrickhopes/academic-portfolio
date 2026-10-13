# NYC Airbnb Price Prediction

This group project studies which public listing characteristics help estimate nightly Airbnb prices in New York City. It combines exploratory analysis, feature engineering, preprocessing, model comparison, and interpretation for a business audience.

## Files

| File | Contents |
| --- | --- |
| [report.pdf](report.pdf) | Ten-slide analysis report with modeling approach, results, recommendations, and limitations |
| [analysis.ipynb](analysis.ipynb) | Original Python notebook, including saved outputs |
| [notebook.html](notebook.html) | Readable static preview generated from the supplied notebook; no cells are executed |

## Methods

Python, pandas, NumPy, Matplotlib, and scikit-learn support data preparation, geographic and amenity features, missing-value imputation, categorical encoding, log-price modeling, and test-set evaluation. The analysis compares a mean-price baseline, Linear Regression, Random Forest, and a tuned Random Forest.

## Reported results

| Model | Test RMSE ($) | Test MAE ($) | Test R² |
| --- | --- | --- | --- |
| Mean-price baseline | 415.73 | 194.03 | -0.00 |
| Linear Regression | 1,376.34 | 122.18 | -9.97 |
| Random Forest | 282.32 | 78.76 | 0.54 |
| Random Forest tuned | 288.50 | 77.05 | 0.52 |

The untuned Random Forest had the best RMSE and R²; tuning gave a slightly lower MAE. These values are preserved from the submitted report and notebook, rather than reproduced in preparation of this portfolio. Extreme prices weaken performance, and the project does not measure changes in bookings or revenue.

## Reproduction notes

The notebook expects `/content/listings.csv` and `/content/Inside Airbnb Data Dictionary - listings.csv detail v4.3.csv`. These CSV files were not supplied in the portfolio attachments. Obtain the original NYC snapshot and dictionary from the project team or [Inside Airbnb](https://insideairbnb.com/get-the-data/); a newer snapshot may produce different results. Saved sample records indicate a June 2026 scrape.

To run in Google Colab, upload those files into `/content` before the loading cells. To run locally, install the listed Python libraries and replace the `/content` paths with your local paths. Some later visualization code uses Colab's upload helper and will need adjustment in a local notebook.

The optional visualization cell also references `/content/airbnb_model_story_visualizations_self_contained.py`, which was not attached. Skip that optional cell unless you obtain the script. The preceding core modeling cells remain available for inspection.

The saved cleaning output reports 21,512 rows, while the later saved predictor split reports 21,515 rows. This difference indicates that the saved outputs should be refreshed with a consistent run before asserting exact reproducibility. No original notebook code or outputs were changed for this portfolio.

## Collaboration

IS 4487, Group 5. Original contributors: Chloe Crowley, Patrick Hopes, Dylan Bindrup, Dhiab Aljabri, and Sager Sharma. Individual responsibilities are not specified in the supplied files. Add your own accurate role to the portfolio settings before claiming particular components.
