from fastapi import APIRouter, HTTPException
from app.models.estudiante import Estudiante
from app.repositories.estudiante_repo import EstudianteRepository

router = APIRouter()
repo = EstudianteRepository()

@router.get("")
@router.get("/")
def listar_estudiantes():
    try:
        return repo.obtener_todos()
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error en consulta a BD: {str(e)}")

@router.get("/{estudiante_id}")
def obtener_estudiante(estudiante_id: int):
    try:
        estudiante = repo.obtener_por_id(estudiante_id)
        if not estudiante:
            raise HTTPException(status_code=404, detail="Estudiante no encontrado")
        return estudiante
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error en BD: {str(e)}")

@router.post("")
@router.post("/")
def crear_estudiante(estudiante: Estudiante):
    try:
        nuevo_id = repo.crear(estudiante)
        return {"mensaje": "Estudiante registrado exitosamente", "id": nuevo_id}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error al crear estudiante: {str(e)}")

@router.delete("/{estudiante_id}")
def eliminar_estudiante(estudiante_id: int):
    try:
        exito = repo.eliminar(estudiante_id)
        if not exito:
            raise HTTPException(status_code=404, detail="Estudiante no encontrado")
        return {"mensaje": "Estudiante eliminado correctamente"}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error al eliminar: {str(e)}")

@router.put("/{estudiante_id}")
def actualizar_estudiante(estudiante_id: int, estudiante: Estudiante):
    try:
        exito = repo.actualizar(estudiante_id, estudiante)
        if not exito:
            raise HTTPException(status_code=404, detail="Estudiante no encontrado")
        return {"mensaje": "Estudiante actualizado correctamente"}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error al actualizar: {str(e)}")