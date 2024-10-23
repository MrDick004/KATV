import xbmc
import xbmcgui
import requests

def main():
    url = 'https://iptv-org.github.io/italy'  # Sostituisci con l'URL della tua lista IPTV
    response = requests.get(url)
    if response.status_code == 200:
        # Elenco dei canali
        channels = response.text.splitlines()
        for channel in channels:
            # Aggiungi ogni canale alla lista di Kodi
            xbmcgui.Dialog().notification("Canale", channel)
    else:
        xbmcgui.Dialog().notification("Errore", "Impossibile caricare la lista IPTV")

if __name__ == '__main__':
    main()
