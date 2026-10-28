from pydantic import BaseModel
from typing import Optional

class Libro(BaseModel):
    id: Optional[int] = None
    titulo: str
    autor: str
    genero: str