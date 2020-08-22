import os
import time
import logging
import requests
from random import choice


logging.basicConfig(level=logging.WARNING)


URL = 'http://' + os.environ.get("DJANGO_BACKEND", "127.0.0.1") + ':' +  os.environ.get("DJANGO_BACKEND_PORT", "8000") + '/api/'


def get_tree_status():
    return choice(['Grows', 'Owergrown', 'Looks unhealthy', 'Dried up', 'Broken'])


while True:
    try:
        all_places = requests.get(URL + 'places/').json()

        if len(all_places) == 0:
            logging.error('Create graveyard, places does not exist.')
            break

        for place in all_places:
            if place['is_busy']:
                update_tree_status = {
                    'tree_status': get_tree_status()
                }

                logging.warning(f' Tree {place["id"]} is {update_tree_status["tree_status"]} now.')

                place_url = URL + 'places/' + str(place['id']) + '/'
                requests.put(place_url, update_tree_status)

                time.sleep(2)
    except:
        time.sleep(4)
    else:
        time.sleep(2)
