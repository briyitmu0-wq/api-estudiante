from app.core.database import Database
from app.models.libro import Libro

class LibroRepository:
    def __init__(self):
        self.db = Database()

    def obtener_todos(self):
        conn = self.db.get_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM libros ORDER BY id ASC;")
        libros = cursor.fetchall()
        conn.close()
        return libros

    def obtener_por_id(self, libro_id: int):
        conn = self.db.get_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM libros WHERE id = %s;", (libro_id,))
        libro = cursor.fetchone()
        conn.close()
        return libro

    def crear(self, libro: Libro):
        conn = self.db.get_connection()
        cursor = conn.cursor()
        query = """
            INSERT INTO libros (titulo, autor, genero) 
            VALUES (%s, %s, %s) RETURNING id;
        """
        cursor.execute(query, (libro.titulo, libro.autor, libro.genero))
        nuevo_id = cursor.fetchone()['id']
        conn.commit()
        conn.close()
        return nuevo_id

    def eliminar(self, libro_id: int):
        conn = self.db.get_connection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM libros WHERE id = %s RETURNING id;", (libro_id,))
        eliminado = cursor.fetchone()
        conn.commit()
        conn.close()
        return eliminado is not None

    def actualizar(self, libro_id: int, libro: Libro):
        conn = self.db.get_connection()
        cursor = conn.cursor()
        query = """
            UPDATE libros
            SET titulo = %s, autor = %s, genero = %s
            WHERE id = %s
            RETURNING id;
        """
        cursor.execute(query, (libro.titulo, libro.autor, libro.genero, libro_id))
        actualizado = cursor.fetchone()
        conn.commit()
        conn.close()
        return actualizado is not None