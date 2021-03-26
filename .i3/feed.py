import os
import time

# links = [
#     "http://g1.globo.com/dynamo/tecnologia/rss2.xml",
#     "http://g1.globo.com/dynamo/economia/rss2.xml",
#     "http://g1.globo.com/dynamo/brasil/rss2.xml",
#     "http://g1.globo.com/dynamo/sc/santa-catarina/rss2.xml?"
# ]

links = [
    "http://g1.globo.com/dynamo/tecnologia/rss2.xml",
]
os.system("echo 'Iniciando a captura do rss'")

base = "rsstail -n1 -1 -N -u %s"

news = [
    os.popen(base % link).read() for link in links
]
while True:
    for new in news:
        os.system("echo " + new)
        time.sleep(3)
