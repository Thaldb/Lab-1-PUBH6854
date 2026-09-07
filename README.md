# PUBH 6854 Lab 1: Reproducible Computing Setup

## Project overview

This repository is my Lab 1 project. It uses a small set of fake patient data to run the same summary in Python and R. The Dockerfile runs the Python version inside a Linux container so I can compare its output with the output from my computer. The project contains no real patient information.

## Repository structure

```text
.
├── README.md
├── AI_USAGE.md
├── Dockerfile
├── environment.yml
├── renv.lock
├── data/
│   └── patients.csv
├── src/
│   └── analyze.py
└── scripts/
    └── analyze.R
```

## Input and output

The input is `data/patients.csv`. It contains fake patient identifiers, ages, and sites. Both scripts calculate the number of patients, the mean age, the youngest and oldest ages, and the number of patients at each site. They print the result in the terminal and do not create a separate output file.

Expected output:

```text
Patient Summary
patient_count: 5
mean_age: 54.6
minimum_age: 39
maximum_age: 72
site_DC: 2
site_MD: 2
site_VA: 1
```

## Prerequisites

- Git
- Conda or Mamba
- R and `renv`
- Docker Desktop (for the container workflow)

## Setup and installation

Clone the public GitHub repository and enter its root directory:

```bash
git clone https://github.com/Thaldb/Lab-1-PUBH6854.git
cd Lab-1-PUBH6854
```

### Python with Conda/Mamba

Create and activate the Python environment from `environment.yml`:

```bash
mamba env create -f environment.yml
conda activate pubh6854-lab1
```

Run the Python analysis from the repository root:

```bash
python src/analyze.py
```

### R with renv

Restore the R package library from `renv.lock`:

```bash
Rscript -e 'renv::restore(prompt = FALSE)'
```

Run the R analysis from the repository root:

```bash
Rscript scripts/analyze.R
```

### Docker

Start Docker Desktop, then build the image from the repository root:

```bash
docker build -t pubh6854-lab1 .
```

Run the container:

```bash
docker run --rm pubh6854-lab1
```

The Python, R, and Docker commands should all print the expected output shown above.

## Virtual environments and Docker

Conda/Mamba and `renv` handle the language runtimes and packages used by Python and R. Docker goes a step further by also providing a Linux operating-system layer, system libraries, the project files, and the command that starts the analysis. The container still needs Python and the required packages installed inside its image; Docker does not automatically include every programming language.

## Reproducibility verification

I deleted and recreated the Python environment using `environment.yml`. I also deleted the local R project library and restored it using `renv.lock`. Both scripts gave the same result after those tests. I built and ran the Docker image, and its result matched the Python and R results from my computer.

## Graduate workflow comparison

Conda/Mamba was easier for me because I could follow the Week 2 practical and it worked without errors. `renv` was more confusing because I had never used it before, and I had to learn why the project kept saying it was out of sync. For a Python project I would choose Conda/Mamba, while for an R project I would choose `renv`.

## AI assistance

Generative AI assistance is documented in [`AI_USAGE.md`](AI_USAGE.md).
