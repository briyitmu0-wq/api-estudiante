import os
import psycopg2
from psycopg2.extras import RealDictCursor
from dotenv import load_dotenv

load_dotenv()

class Database:
    def __init__(self):
        self.host = os.getenv("DB_HOST", "ep-little-forest-b4bm8ptc-pooler.c-6.us-east-2.aws.neon.tech")
        self.database = os.getenv("DB_NAME", "neondb")
        self.user = os.getenv("DB_USER", "neondb_owner")
        self.password = os.getenv("DB_PASSWORD", "npg_Mp2VXw6hSJim")
        self.port = os.getenv("DB_PORT", "5432")

    def get_connection(self):
        try:
            return psycopg2.connect(
                host=self.host,
                database=self.database,
                user=self.user,
                password=self.password,
                port=self.port,
                sslmode="require",
                cursor_factory=RealDictCursor
            )
        except Exception as e:
            print(f"Error de conexión a la BD: {e}")
            raise e