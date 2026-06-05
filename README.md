# DNN

A repo to practice deep nural network concepts.

## Requirements

- Python 3.12+
- [uv](https://docs.astral.sh/uv/) (package & environment manager)
- [just](https://github.com/casey/just) (command runner)

## Getting started

```bash
just bootstrap     # create the virtualenv, install deps, install git hooks
just check         # lint + format-check + type-check + tests
```

Run `just` with no arguments to list every command.

## Development

```bash
just fmt           # auto-format with ruff
just lint          # ruff lint (with --fix)
just type          # mypy
just test          # pytest
just build         # build sdist + wheel into dist/
just docs          # serve docs locally at http://127.0.0.1:8000
```

## Branching & commits

`main` is protected. A pre-commit hook (`no-commit-to-branch`) blocks direct
commits to `main`/`master` — always work on a feature branch and open a PR.

## Project layout

```
dnn/
├── src/dnn/      # package code
├── tests/                  # pytest tests
├── pyproject.toml          # project metadata, deps, tool config
├── justfile                # task runner
└── .pre-commit-config.yaml # git hooks
```

## License

MIT — see [LICENSE](LICENSE).
