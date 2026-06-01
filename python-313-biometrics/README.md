# python-313-biometrics

Public Docker base for [biometrics-processor](https://github.com/treeleaftech/biometrics-processor): Python 3.13 (trixie), OS libs, and **frozen public PyPI** dependencies only.

Private packages **`biometricslib`** and **`fingerprintlib`** are **not** in this image. They are installed during the private app build (`GITHUB_TOKEN` + `uv sync`).

## Build

```bash
docker build -t ashokpant/python-313-biometrics:latest .
docker push ashokpant/python-313-biometrics:latest
```

No `GITHUB_TOKEN` required for this image.

## Refresh `requirements.txt`

When dependencies change in biometrics-processor:

```bash
make export-requirements
make build push
```

## Contents

- `/opt/venv` — FastAPI, ONNX Runtime, OpenCV headless, Numba, nbis-python, grpclib, etc.
- glibc ≥ 2.38 (trixie) for nbis-python bundled OpenCV
