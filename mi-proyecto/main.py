from fastapi import FastAPI
from app.api.rutas_estudiantes import router as router_estudiantes
from app.api.rutas_libros import router as router_libros
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="API de Desempeño Estudiantil",
    description="Backend modular para monitoreo académico usando FastAPI y PostgreSQL",
    version="1.0.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Se incluyen los routers directamente para que tomen el prefijo definido en cada archivo
app.include_router(router_estudiantes)
app.include_router(router_libros)

@app.get("/")
def estado_api():
    return {"mensaje": "La API de monitoreo se encuentra en línea y funcional"}