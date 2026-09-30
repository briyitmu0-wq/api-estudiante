from fastapi import FastAPI
from app.api import rutas_estudiantes

app = FastAPI(
    title="API de Desempeño Estudiantil",
    description="Backend modular para monitoreo académico usando FastAPI y PostgreSQL puro",
    version="1.0.0"
)

app.include_router(rutas_estudiantes.router)

@app.get("/")
def estado_api():
    return {"mensaje": "La API de monitoreo se encuentra en línea y funcional"}