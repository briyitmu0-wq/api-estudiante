from fastapi import APIRouter, HTTPException
from app.models.libro import Libro
from app.repositories.libro_repo import LibroRepository

router = APIRouter(prefix="/api", tags=["Gestión de Libros"])
repo = LibroRepository()

@router.get("/libros")
def listar_libros():
    return repo.obtener_todos()

@router.get("/libros/{libro_id}")
def obtener_libro(libro_id: int):
    libro = repo.obtener_por_id(libro_id)
    if not libro:
        raise HTTPException(status_code=404, detail="Libro no encontrado")
    return libro

@router.post("/libros")
def crear_libro(libro: Libro):
    nuevo_id = repo.crear(libro)
    return {"mensaje": "Libro registrado exitosamente", "id": nuevo_id}

@router.delete("/libros/{libro_id}")
def eliminar_libro(libro_id: int):
    exito = repo.eliminar(libro_id)
    if not exito:
        raise HTTPException(status_code=404, detail="Libro no encontrado")
    return {"mensaje": "Libro eliminado correctamente"}

@router.put("/libros/{libro_id}")
def actualizar_libro(libro_id: int, libro: Libro):
    exito = repo.actualizar(libro_id, libro)
    if not exito:
        raise HTTPException(status_code=404, detail="Libro no encontrado")
    return {"mensaje": "Libro actualizado correctamente"}