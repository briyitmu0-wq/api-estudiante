import os
import psycopg2
from psycopg2.extras import RealDictCursor

class Database:
    def __init__(self):
        # Cadena de conexión directa estandarizada para Neon DB
        self.db_url = os.getenv(
            "DATABASE_URL",
            "postgresql://neondb_owner:npg_Mp2VXw6hSJim@ep-little-forest-b4bm8ptc-pooler.c-6.us-east-2.aws.neon.tech/neondb?sslmode=require"
        )

    def get_connection(self):
        try:
            return psycopg2.connect(
                self.db_url,
                cursor_factory=RealDictCursor
            )
        except Exception as e:
            print(f"Error al conectar con la base de datos: {e}")
            raise e