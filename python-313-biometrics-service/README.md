# python-313-biometrics-service

Base Docker image for **biometrics-poc-service** (REST API + BiometricsServiceRpc client).

Includes Python 3.13, a prebuilt virtualenv at `/app/.venv`, and runtime libraries for:

- FastAPI / Uvicorn
- grpclib + betterproto2 (calls biometrics-processor)
- PostgreSQL (SQLAlchemy, psycopg, pgvector)
- S3 (boto3)
- OpenCV headless + NumPy (client-side image decode/enhance only)

Does **not** include ML stacks (torch, onnxruntime, nbis, chromadb, etc.) — those belong in `python-313-biometrics-processor`.

## Build

```bash
make build IMAGE=ashokpant/python-313-biometrics-service:v1.0.0
```

## Push

```bash
make push IMAGE=your-registry/python-313-biometrics-service:v1.0.0 PLATFORMS=linux/amd64,linux/arm64
```

## Use in biometrics-poc-service

```dockerfile
ARG BASE_IMAGE=your-registry/python-313-biometrics-service:v1.0.0
FROM ${BASE_IMAGE}

COPY --chown=appuser:appuser src ./src
EXPOSE 8787 8788
CMD ["python", "-m", "src.main"]
```

The app image only copies application code; dependencies come from the base venv at `/app/.venv`.
