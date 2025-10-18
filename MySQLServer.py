import mysql.connector
# Removed 'from mysql.connector import Error' to explicitly use mysql.connector.Error

# --- Configuration ---
DATABASE_NAME = "alx_book_store"

# The mandatory DDL statement
CREATE_DB_QUERY = f"CREATE DATABASE IF NOT EXISTS {DATABASE_NAME}"

# !!! UPDATE these credentials to match your MySQL setup !!!
DB_CONFIG = {
    "host": "localhost",
    "user": "your_username", 
    "password": "your_password",
}

def create_database():
    """
    Connects to the MySQL server and executes the DDL statement 
    'CREATE DATABASE IF NOT EXISTS alx_book_store'.
    """
    db_connection = None
    try:
        # 1. Connect to the MySQL server
        print("Attempting to connect to the MySQL server...")
        db_connection = mysql.connector.connect(**DB_CONFIG)
        
        if db_connection.is_connected():
            cursor = db_connection.cursor()
            print("Successfully connected to MySQL server.")

            # 2. Execute the mandatory DDL statement
            print(f"Executing DDL: {CREATE_DB_QUERY}")
            cursor.execute(CREATE_DB_QUERY)
            
            # 3. Print the mandatory success message
            # Required print message when database is successfully created.
            print(f"Database '{DATABASE_NAME}' created successfully!")
            
            cursor.close()
        
    except mysql.connector.Error as err:
        # This is the fix: explicitly catching mysql.connector.Error
        # Required print error message to handle errors when failing to connect to the DB.
        print(f"\n--- DATABASE CONNECTION ERROR ---")
        print(f"Failed to connect or execute command: {err}")
        print("ACTION REQUIRED: Please verify your database server is running and your 'user' and 'password' are correct.")

    finally:
        # 4. Handle open and close of the DB in your script.
        if db_connection and db_connection.is_connected():
            db_connection.close()
            print("MySQL connection closed.")

if __name__ == "__main__":
    create_database()