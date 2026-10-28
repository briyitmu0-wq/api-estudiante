from fastapi import APIRouter, HTTPException
from app.models.libro import Libro
from app.repositories.libro_repo import LibroRepository

router = APIRouter()
repo = LibroRepository()

@router.get("")
@router.get("/")
def listar_libros():
    return repo.obtener_todos()

@router.get("/{libro_id}")
def obtener_libro(libro_id: int):
    libro = repo.obtener_por_id(libro_id)
    if not libro:
        raise HTTPException(status_code=404, detail="Libro no encontrado")
    return libro

@router.post("")
@router.post("/")
def crear_libro(libro: Libro):
    nuevo_id = repo.crear(libro)
    return {"mensaje": "Libro registrado exitosamente", "id": nuevo_id}

@router.delete("/{libro_id}")
def eliminar_libro(libro_id: int):
    exito = repo.eliminar(libro_id)
    if not exito:
        raise HTTPException(status_code=404, detail="Libro no encontrado")
    return {"mensaje": "Libro eliminado correctamente"}

@router.put("/{libro_id}")
def actualizar_libro(libro_id: int, libro: Libro):
    exito = repo.actualizar(libro_id, libro)
    if not exito:
        raise HTTPException(status_code=404, detail="Libro no encontrado")
    return {"mensaje": "Libro actualizado correctamente"}