FROM condaforge/miniforge3:latest

WORKDIR /workspace

COPY environment.yml .
RUN mamba env create -f environment.yml && mamba clean -afy

COPY data/ data/
COPY src/ src/

CMD ["conda", "run", "--no-capture-output", "-n", "pubh6854-lab1", "python", "src/analyze.py"]
