import sys
import xbmc
import xbmcgui
import xbmcplugin
import requests
from bs4 import BeautifulSoup

# Imposta il plugin
addon_id = 'plugin.video.streamingcommunity'
plugin = int(sys.argv[1])

def list_videos(query):
    url = f"https://streamingcommunity.paris/search?q={query}"
    response = requests.get(url)
    soup = BeautifulSoup(response.content, 'html.parser')

    # Esempio di parsing dei video
    for video in soup.find_all('div', class_='video-class'):  # Modifica con la classe corretta
        title = video.find('h3').text
        video_url = video.find('a')['href']
        # Aggiungi il video alla lista
        xbmcplugin.addDirectoryItem(plugin, video_url, xbmcgui.ListItem(label=title), isFolder=False)

    xbmcplugin.endOfDirectory(plugin)

if __name__ == '__main__':
    query = xbmcgui.Dialog().input("Cerca video")
    list_videos(query)

