import mysql.connector
from mysql.connector import Error

# --- Configuration ---
DATABASE_NAME = "alx_book_store"
# !!! UPDATE these credentials to match your MySQL setup !!!
DB_CONFIG = {
    "host": "localhost",
    "user": "your_username", 
    "password": "your_password",
    # We do NOT specify a database here, as we are creating it
}

def create_database():
    """
    Connects to the MySQL server and creates the 'alx_book_store' database
    using the DDL statement: CREATE DATABASE IF NOT EXISTS.
    """
    db_connection = None
    try:
        # 1. Connect to the MySQL server
        print("Attempting to connect to the MySQL server...")
        db_connection = mysql.connector.connect(**DB_CONFIG)
        
        if db_connection.is_connected():
            cursor = db_connection.cursor()
            print("Successfully connected to MySQL server.")

            # 2. Define the exact DDL statement required
            create_db_query = f"CREATE DATABASE IF NOT EXISTS {DATABASE_NAME}"
            
            # 3. Execute the DDL statement
            print(f"Executing DDL: {create_db_query}")
            cursor.execute(create_db_query)
            
            # 4. Print the mandatory success message
            print(f"Database '{DATABASE_NAME}' created successfully!")
            
            cursor.close()
        
    except Error as err:
        # Handle connection and execution errors
        print(f"\n--- DATABASE CONNECTION ERROR ---")
        print(f"Failed to connect or execute command: {err}")
        print("ACTION REQUIRED: Please verify your database server is running and your 'user' and 'password' in the script are correct.")

    finally:
        # 5. Ensure the connection is closed
        if db_connection and db_connection.is_connected():
            db_connection.close()
            print("MySQL connection closed.")

if __name__ == "__main__":
    create_database()