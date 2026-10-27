from pydantic import BaseModel
from typing import Optional

class Estudiante(BaseModel):
    id: Optional[int] = None
    nombre: str
    grado: str
    promedio: float