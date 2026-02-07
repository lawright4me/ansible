import os
from datetime import datetime
import subprocess

# Настройка параметров
DB_NAME = "your_database"
DB_USER = "your_user"
BACKUP_DIR = "/path/to/backup/dir"
TIMESTAMP = datetime.now().strftime("%Y-%m-%d")
BACKUP_FILE = os.path.join(BACKUP_DIR, f"{DB_NAME}_backup_{TIMESTAMP}.sql")

# Команда для дампа PostgreSQL
command = f"PGPASSWORD='your_password' pg_dump -U {DB_USER} {DB_NAME} > {BACKUP_FILE}"

# Выполнение команды
subprocess.call(command, shell=True)

# Опциональное сжатие
subprocess.call(["gzip", BACKUP_FILE])

print(f"Бэкап PostgreSQL завершён: {BACKUP_FILE}.gz")
