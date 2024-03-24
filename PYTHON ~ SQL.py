# Please enter Your username and password on lines 32 and 33 before running the code 
import mysql.connector
from bs4 import BeautifulSoup
from urllib.request import urlopen



url = "https://www.sleephealthfoundation.org.au/facts-about-dreaming.html"



storage = []
with urlopen(url) as html_file:
    soup = BeautifulSoup(html_file, 'html.parser')
    #print(soup)
    body = soup.find("div", attrs = {'id' : "rt-mainbody"})
    #print(body)
    ps = body.find_all('p')
    #print(ps)
    for i, p in enumerate(ps):
        if i != 0 and i != len(ps)-1:
            #print(p.strong.text)
            #print('\n', p.text, '\n')
            caption, fact = p.strong.text, p.text
            storage.append((caption, fact))

    #print(storage)
    
    

# MySQL Connection Configuration
config = {
    'user': 'Nane',
    'password': 'korglp380',
    'host': 'localhost',
    'database': 'dreamjournal'
}

# Connect to MySQL
conn = mysql.connector.connect(**config)

# Perform database operations
c = conn.cursor()


c.execute("""
          DROP TABLE IF EXISTS DreamFacts
          """)
          
c.execute("""
          CREATE TABLE DreamFacts(
              id INT AUTO_INCREMENT PRIMARY KEY,
              caption VARCHAR(300),
              fact VARCHAR(500))
          """)

          
insert_query = """
    INSERT INTO DreamFacts (caption, fact)
    VALUES (%s, %s)
"""

c.executemany(insert_query, storage)


# Fetch and print the inserted rows
c.execute("SELECT * FROM DreamFacts")
rows = c.fetchall()
for row in rows:
    print(row)
    print('\n', '\n')

# Close the cursor and connection
c.close()
conn.commit()
conn.close()



