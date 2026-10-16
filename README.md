# Shruti Priya

[![Build Resume](https://github.com/ipshruti/resume/actions/workflows/build.yml/badge.svg)](https://github.com/ipshruti/resume/actions/workflows/build.yml)
[![View PDF](https://img.shields.io/badge/View-PDF-blue)](https://pshruti.com/cv)

My resume files, deployed at: https://pshruti.com/cv

## Updating the resume

Requires [pixi](https://pixi.sh). The LaTeX compiler ([Tectonic](https://tectonic-typesetting.github.io/)) is installed automatically.

| Command | What it does |
| --- | --- |
| `pixi run update` | Import the newest Overleaf zip from `~/Downloads` and rebuild the PDF |
| `pixi run import [file.zip]` | Copy the `.tex`/`.sty` sources from an Overleaf zip (defaults to the newest `~/Downloads/Shruti_Priya_Resume*.zip`) |
| `pixi run build` | Compile `resume.tex` into `Shruti_Priya_CV.pdf` |
| `pixi run open` | Open the PDF |

Typical flow: edit in Overleaf → Menu → Download → Source → `pixi run update` → commit.
You can also skip Overleaf and edit the files in `sections/` directly, then `pixi run build`.

Pushes to `main` build the PDF in GitHub Actions and deploy it to the `gh-pages` branch, which serves [pshruti.com/cv](https://pshruti.com/cv).

Based on the [Data Science Tech Resume Template](https://www.overleaf.com/latex/templates/data-science-tech-resume-template/zcdmpfxrzjhv) by [Timmy Chan](https://github.com/TimmyChan), licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
