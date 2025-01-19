import sys
import xbmc
import xbmcgui
import requests
from bs4 import BeautifulSoup

def search_videos(query):
    url = f'https://www.cb01.com/search?q={query}'
    response = requests.get(url)
    soup = BeautifulSoup(response.content, 'html.parser')

    # Esempio di estrazione dei video (modifica in base alla struttura del sito)
    for link in soup.find_all('a', class_='video-link'):
        video_url = link.get('href')
        title = link.get('title')
        xbmcgui.Dialog().ok(title, video_url)

def main():
    # Mostra un dialogo per la ricerca
    keyboard = xbmc.Keyboard('', 'Cerca video')
    keyboard.doModal()
    if keyboard.isConfirmed():
        query = keyboard.getText()
        if query:
            search_videos(query)

if __name__ == '__main__':
    main()

