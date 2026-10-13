# Publish Your Professional Portfolio on GitHub Pages

This guide takes you from the downloaded portfolio package to a public website. You can complete the setup in your web browser. Your portfolio is a static HTML page; no programming installation, paid hosting, or custom domain is required for this setup.

**Start with the complete ZIP package.** The separate `index.html` is the portfolio page, but its document links depend on the `projects` folder included in the ZIP. GitHub stores your files in a repository; GitHub Pages turns the HTML into a website.

## 1. Download and extract the package

1. Download `phil-hopkins-portfolio.zip` to your computer.
2. On Windows, right-click the ZIP and select **Extract All**. On macOS, double-click it.
3. Open the extracted `phil-hopkins-portfolio` folder.
4. Double-click `index.html` to review the portfolio in your browser. Keep the `projects` folder beside it so the document links work.
5. Open `GITHUB-SETUP-GUIDE.html` to read this guide locally. A Markdown version is also included for GitHub.

The page contains seven projects with related files grouped together. The original ten files have been copied without changing their contents and given simple filenames for reliable web links.

## 2. Confirm your name and add your public links

The page currently uses **Phil Hopkins**. Several supplied reports credit **Patrick Hopes** or **Patric Hopes**. Confirm the portfolio name and your relationship to the credited authors before sharing the site. The original author credits remain in the documents and project notes.

1. Right-click `index.html` and choose **Open with → Notepad**, or use another plain-text editor. Do not use Word to edit the HTML.
2. Near the top, find the comment **EDIT BEFORE PUBLISHING**.
3. Edit the settings below. Keep the quotation marks and commas. These example values must be replaced with your own details:

```javascript
const PORTFOLIO = {
  name: "Phil Hopkins",
  initials: "PH",
  githubUsername: "YOUR-GITHUB-USERNAME",
  repositoryName: "YOUR-GITHUB-USERNAME.github.io",
  linkedinUrl: "https://www.linkedin.com/in/YOUR-PROFILE/",
  email: "YOUR-PUBLIC-CONTACT-EMAIL",
  individualContributions: {
    airbnb: "",
    database: "",
    housing: "",
    seo: ""
  }
};
```

Use your GitHub username, which is the account name in `https://github.com/yourusername`. It may be different from your display name. Enter your actual LinkedIn profile URL. You can leave `linkedinUrl` and `email` as `""` if you do not want those buttons. Blank fields are hidden. A GitHub profile link is also inferred when the page is hosted at a `github.io` address.

For group projects, add one accurate sentence describing your personal contribution in the relevant `individualContributions` field. For example, describe the components you actually worked on rather than claiming the whole project. Leaving these fields blank keeps the page labeled as group work.

Save the file, refresh your browser, and check the changes. If you change your name, also update it in `README.md` with a plain-text editor. Save as **All files** if Notepad offers that choice, so the filename stays `index.html` rather than `index.html.txt`.

## 3. Create your GitHub repository

1. Sign in at [github.com](https://github.com/), or create an account if you do not have one. Verify your account email.
2. Click the **+** menu near the top right, then choose **New repository**.
3. Select your own account as the owner.
4. Name the repository **`yourusername.github.io`**, replacing `yourusername` with your actual GitHub username in lowercase. For example, an account named `sampleuser` uses `sampleuser.github.io`.
5. Add a description such as **Academic portfolio in data analytics, information systems, and business analysis**.
6. Select **Public** for this GitHub Free setup.
7. Turn on **Add README** so the repository starts with a default branch. You will replace the initial README with the one in the package.
8. Click **Create repository**. Confirm that the branch dropdown shows **main**.

If you already have a repository named `yourusername.github.io`, use it only if you intend to update its existing website. You can also create a project repository named `portfolio`; that produces a site at `https://yourusername.github.io/portfolio/`. The portfolio uses relative document paths, so both layouts work. If you choose `portfolio`, set `repositoryName` to `"portfolio"` in the settings block.

## 4. Upload the HTML and project documents together

Upload the **contents of the extracted folder**, rather than the ZIP or the enclosing `phil-hopkins-portfolio` folder.

1. Open the repository’s **Code** tab and stay at its top level, on `main`.
2. Select **Add file → Upload files**.
3. Drag these items from your extracted folder into the upload area: `index.html`, `README.md`, `.nojekyll`, `GITHUB-SETUP-GUIDE.html`, `GITHUB-SETUP-GUIDE.md`, and the entire `projects` folder.
4. Check the upload list. It should show `index.html` at the top level and paths such as `projects/airbnb-price-analysis/report.pdf` for the documents.
5. Enter a commit message such as **Add professional portfolio and project files**. A commit is a saved version of your repository’s files.
6. Choose **Commit directly to the main branch**, then click **Commit changes**. If GitHub starts a new branch instead, complete its pull request and merge it into `main` before enabling Pages.

All files in this package are below GitHub’s browser-upload limit of **25 MiB per file**, and the package contains fewer than 100 files. You can use the browser upload method for the entire package. The database and housing PDFs are the largest items; allow their uploads to finish.

### Check the top level after uploading

| Item | Location in the repository | Purpose |
| --- | --- | --- |
| `index.html` | Top level | Portfolio homepage |
| `README.md` | Top level | Project overview shown on GitHub |
| `.nojekyll` | Top level | Keeps this package on the static-file publishing path |
| `projects` | Top-level folder | Original documents, code, project notes, and notebook preview |
| `GITHUB-SETUP-GUIDE.html` | Top level | Readable setup guide |
| `GITHUB-SETUP-GUIDE.md` | Top level | GitHub-readable setup guide |

If you cannot see `.nojekyll` locally, you can create it on GitHub with **Add file → Create new file**. Name it exactly `.nojekyll`, enter `Static portfolio files`, and commit it to `main`. Its presence is what matters; it has no filename extension.

### If dragging a folder does not preserve its subfolders

Upload the top-level files first. Then create each project folder through GitHub:

1. Choose **Add file → Create new file** from the repository’s top level.
2. Enter the complete path, such as `projects/airbnb-price-analysis/README.md`. The slashes create the folders.
3. Copy the text from that project’s included `README.md` into the editor and commit it.
4. Open the newly created project folder on GitHub, choose **Add file → Upload files**, and upload the remaining files from the matching local folder.
5. Repeat for the seven folders listed below. Preserve every filename exactly.

### How your original files are organized

| Project | Original supplied file | Uploaded path |
| --- | --- | --- |
| NYC Airbnb Price Prediction | `Group_5_Airbnb_NYC_Price_Analysis.pdf` | `projects/airbnb-price-analysis/report.pdf` |
| NYC Airbnb Price Prediction | `group_5_final_python_notebook.ipynb` | `projects/airbnb-price-analysis/analysis.ipynb` |
| Loan Default Risk Assessment | `loan_default_capstone_final.xlsx` | `projects/loan-default-risk/loan-default-capstone.xlsx` |
| Retail Sales and Service Database | `Database Project Final.sql` | `projects/retail-database/database.sql` |
| Retail Sales and Service Database | `Database Project Report Final.pdf` | `projects/retail-database/report.pdf` |
| Athlete Housing Search and Approval | `SU26_IS4430_Group1.pdf` | `projects/athlete-housing-system/report.pdf` |
| AI Knowledge Assistant Grounding | `AI Grounding Test.docx` | `projects/ai-grounding/grounding-test.docx` |
| Family Activities Landing Page | `Website Landing Page Final Project.docx` | `projects/seo-landing-page/strategy.docx` |
| Family Activities Landing Page | `Website-Landing-Page.txt` | `projects/seo-landing-page/website-reference.txt` |
| Economic Analysis of Negligence | `EconomicLaw_Negligence_Liability.docx` | `projects/negligence-economic-analysis/analysis.docx` |

Each project folder also contains its own `README.md` and a formatted `README.html` version. The Airbnb folder includes `notebook.html`, a readable preview of the supplied notebook’s saved content and outputs. Upload these additional files as well.

## 5. Enable GitHub Pages

1. In your repository, open **Settings**.
2. In the left sidebar, select **Pages** under **Code, planning, and automation**.
3. Under **Build and deployment**, set **Source** to **Deploy from a branch**.
4. Set the branch to **main** and the folder to **/(root)**.
5. Click **Save**.

You do not need to write a GitHub Actions workflow for this package. GitHub handles the Pages deployment after you select the branch and folder.

## 6. Open and check your website

1. Allow time for deployment. GitHub says updates can take up to **10 minutes** to appear.
2. Return to **Settings → Pages** and use **Visit site** when it appears.
3. For the recommended repository name, your website address is **`https://yourusername.github.io/`**. A normal repository page at `github.com/yourusername/yourusername.github.io` shows your files rather than the portfolio website.
4. Use the repository’s **Actions** tab to check deployment status if the site is not ready.
5. Open the site on your computer and phone. Check the project filters, expandable case studies, contact buttons, and every file link.

PDF reports normally open in the browser. Word documents and the Excel workbook are downloads that you open in Word or Excel. The notebook preview shows saved analysis; GitHub Pages does not execute Python or retrain the models.

Open the linked housing prototype and Seven Slopes project page before sharing them. Their URLs were supplied in the original materials, but their current availability could not be independently verified during preparation. Their supporting documents are included even if those external pages become unavailable.

## 7. Add the website to your professional profiles

1. In your repository’s **About** area, use the settings gear to add your published website URL and a short description.
2. Add the same URL to the website field on your GitHub profile.
3. Add the link to your LinkedIn profile and, if desired, feature it as a project link.
4. Share the published Pages URL in applications or your résumé.

The profile README displayed on your main GitHub profile is a separate optional feature. This package provides the website and its repository README; you do not need a profile README to publish the portfolio.

## 8. Update your portfolio later

To edit text or settings, open `index.html` in GitHub, click the pencil to edit, and commit your changes to `main`. The site redeploys automatically. You can also edit locally and upload the changed file again.

To replace a document, upload the new version into the same project folder using the same filename. The existing portfolio link will continue to work. If you change the filename or folder, update the corresponding `href` path in `index.html` too.

For a new project, duplicate one `<article class="project">` block, give it a unique `id` and heading ID, choose an existing `data-category`, write its summary, and add its file links. Upload its files into a new folder under `projects`. Update the visible seven-project and ten-file totals, project numbering, and repository README to reflect the new collection. The filter counter updates from the actual project articles.

## Troubleshooting

| Problem | What to check |
| --- | --- |
| The website shows 404 | Check `Settings → Pages`, `main`, and `/(root)`. Confirm `index.html` is at the top level, with that exact lowercase name. Wait for deployment to finish. |
| GitHub shows the README instead of the portfolio | Confirm you uploaded `index.html` to the selected publishing folder, then open the `github.io` URL. |
| Documents return 404 | Check the full path, capitalization, and filename. Confirm you uploaded the `projects` folder rather than just the homepage. |
| Files are under `phil-hopkins-portfolio/index.html` | The enclosing folder was uploaded. Upload its contents to the repository’s top level and confirm `index.html` is there. |
| The upload contains only a ZIP | Extract it on your computer, then upload the extracted contents. GitHub Pages does not unpack the ZIP for you. |
| The file is named `index.html.txt` | Enable **View → Show → File name extensions** in Windows File Explorer and rename it to `index.html`. |
| Profile buttons are missing | Blank fields are hidden. Check the settings block; LinkedIn must use a complete `https://www.linkedin.com/...` URL. |
| Changes are not visible | Check the deployment in **Actions**, wait for it to finish, then refresh or try a private browser window. |
| The Python notebook does not run on the website | It is a static preview. Download the notebook and supply its original data in Python or Colab to run it. See that project’s README for missing dependencies. |

## What is included and what to review

The package includes the complete portfolio HTML with embedded styling, scripts, and evidence images; the original ten attachments; seven project notes; a notebook preview; and this guide. The homepage needs no external font or JavaScript library to render.

The portfolio was checked for internal file paths, embedded script syntax, project grouping, and source-file preservation. A browser visual review and a live GitHub Pages deployment were not performed in this environment. Review the layout locally and after publishing.

The project materials are preserved as supplied. The Airbnb CSV and data dictionary, an optional visualization script, and the loan model’s R/SQL source files were not attached. Numerical model results are presented as **reported results**, rather than newly reproduced findings. Group project contribution fields are intentionally blank until you add your own role.

Because this setup makes the documents public, confirm that you are comfortable sharing the included team reports and author credits. The page retains collaborative attribution and makes no claims about grades, professional employment, or measured business improvements.

## Official references

These instructions were checked against GitHub’s documentation on October 13, 2026. Interface wording may change.

- [Creating a GitHub Pages site](https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site)
- [Configuring a publishing source](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)
- [Adding files to a repository](https://docs.github.com/en/repositories/working-with-files/managing-files/adding-a-file-to-a-repository)
- [About GitHub Pages](https://docs.github.com/en/pages/getting-started-with-github-pages/about-github-pages)
