from fastapi import FastAPI
from app.api import rutas_estudiantes  
from app.api import rutas_libros  # <-- Debe tener la 's' al final
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

app.include_router(rutas_estudiantes.router, prefix="/api/estudiantes", tags=["Estudiantes"])
app.include_router(rutas_libros.router, prefix="/api/libros", tags=["Libros"])  # <-- Aquí también con 's'

@app.get("/")
def estado_api():
    return {"mensaje": "La API de monitoreo se encuentra en línea y funcional"}