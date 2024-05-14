import mysql.connector

# Connect to the MySQL server
cnx = mysql.connector.connect(user='root', password='your_mysql_password')

# Create a cursor object
cursor = cnx.cursor()

# Create the database if it doesn't exist
cursor.execute("CREATE DATABASE IF NOT EXISTS hbnb_dev_db")

# Create the user if it doesn't exist
cursor.execute("CREATE USER IF NOT EXISTS 'hbnb_dev'@'localhost' IDENTIFIED BY 'hbnb_dev_pwd'")

# Grant all privileges on hbnb_dev_db to hbnb_dev
cursor.execute("GRANT ALL PRIVILEGES ON hbnb_dev_db.* TO 'hbnb_dev'@'localhost'")

# Grant SELECT privilege on performance_schema to hbnb_dev
cursor.execute("GRANT SELECT ON performance_schema.* TO 'hbnb_dev'@'localhost'")

# Flush privileges to apply the changes
cursor.execute("FLUSH PRIVILEGES")

# Close the cursor and the connection
cursor.close()
cnx.close()
