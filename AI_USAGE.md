# AI Usage

## What I used

I used OpenAI Codex in the Codex desktop app with the GPT-5.6 Sol model. I used it as a guide while I typed commands and checked the results. It also helped me understand the assignment, plan the folder structure, draft the Python and R scripts and Dockerfile, and organize the README. I reviewed the files and ran the important commands before keeping its suggestions.

## R error: missing dplyr

I ran the R script before installing `dplyr` and got this error:

```text
- The project is out-of-sync -- use `renv::status()` for details.
Error in loadNamespace(x) : there is no package called ‘dplyr’
Calls: loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
```

I first asked Codex, "What does this error mean?" It explained that my script needed `dplyr`, but that package was not installed in this project's `renv` library. It also explained that "out-of-sync" meant the installed library and the lockfile did not match yet. I then asked, "How do I fix it?"

Codex suggested this command:

```bash
Rscript -e 'renv::install("dplyr")'
```

Before running the fix, I checked my working directory, the `renv` project path, and the R library path. They all pointed to `/Users/thalie/Desktop/DevTools/Lab-1-PUBH6854`. This showed that the command would install the package in my project instead of changing an unrelated R library. I chose the project installation instead of manually editing `renv.lock`, hiding the error, or removing `dplyr` from the script just to make the error disappear.

After installing it, I checked that R found `dplyr` version 1.2.1. I ran the script again and got:

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

I then created `renv.lock`. I checked that `dplyr` version 1.2.1 was in the file. I deleted the local R project library, restored it from `renv.lock`, and ran the script again. The output stayed the same, and `renv::status()` said, "No issues found -- the project is in a consistent state."

## Docker error: daemon not running

I checked the Docker engine and got this error:

```text
Docker Engine:
Cannot connect to the Docker daemon at unix:///Users/thalie/.docker/run/docker.sock. Is the docker daemon running?
```

I first asked Codex, "What does this Docker error mean?" It explained that the Docker command was installed, but it could not reach the Docker service that builds and runs containers. I then asked, "How do I fix it?"

Codex suggested starting Docker Desktop and waiting for the engine. Before trying the fix, I knew that the `docker` command already worked and that the message named Docker Desktop's socket. I had not tried to build the Dockerfile yet, so this could not be an error in my project code. This is why I chose to start Docker Desktop first instead of reinstalling Docker, deleting the socket, or changing Docker contexts.

I ran the check again after starting Docker Desktop and got:

```text
Docker Engine: 29.7.2
```

I then ran the exact `docker build` and `docker run` commands from my README. The build finished all 11 steps, and the container printed the expected patient summary. I compared that result with the Python and R results using `diff -u`. The command printed nothing, meaning the output files were identical.

## Other help and changes

Some of my questions to Codex were:

```text
What is the toy project and what exactly does the assignment say is required from the rubric?
```

Codex checked the course instructions and rubric and explained that a toy project is a small example used to prove that the setup works. It suggested using one fake patient CSV for both languages. I chose to use this idea because it was similar to the Week 1 practical and made the correct results easy to calculate by hand.
