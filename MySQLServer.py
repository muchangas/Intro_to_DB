import mysql.connector

# --- Database and Connection Details ---
DATABASE_NAME = "alx_book_store"
# NOTE: Replace 'your_username' and 'your_password' with your actual MySQL credentials
DB_CONFIG = {
    "host": "localhost",
    "user": "your_username", 
    "password": "your_password",
    # We do NOT specify the database here, as we are trying to create it
}

def create_database():
    """
    Connects to the MySQL server and creates the specified database using
    the CREATE DATABASE IF NOT EXISTS statement.
    """
    db_connection = None
    try:
        # 1. Connect to the MySQL server (without specifying the database)
        print("Attempting to connect to the MySQL server...")
        db_connection = mysql.connector.connect(**DB_CONFIG)
        
        # Check if the connection was successful
        if db_connection.is_connected():
            cursor = db_connection.cursor()
            print("Connection successful.")

            # 2. DDL: Execute the CREATE DATABASE statement
            # The 'IF NOT EXISTS' clause prevents the script from failing if the database exists.
            create_db_query = f"CREATE DATABASE IF NOT EXISTS {DATABASE_NAME}"
            
            print(f"Executing: {create_db_query}")
            cursor.execute(create_db_query)
            
            # Print the success message
            print(f"Database '{DATABASE_NAME}' created successfully (or already exists)!")
            
            # 3. Close the cursor
            cursor.close()
        
    except mysql.connector.Error as err:
        # Handle connection errors (e.g., wrong credentials, server offline)
        print(f"Error connecting to MySQL: {err}")
        print("Please check your database connection details (host, user, password) and ensure the MySQL server is running.")

    finally:
        # 4. Handle open and close of the DB connection
        if db_connection and db_connection.is_connected():
            db_connection.close()
            print("MySQL connection closed.")

if __name__ == "__main__":
    create_database()