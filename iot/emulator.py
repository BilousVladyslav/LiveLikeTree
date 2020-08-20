import requests
import time
import logging
from random import choice


# logging.basicConfig(level=logging.DEBUG)


def get_tree_status():
    return choice(['Grows', 'Owergrown', 'Looks unhealthy', 'Dried up', 'Broken'])


while True:
    all_places = requests.get('http://localhost:8000/api/places/').json()

    if len(all_places) == 0:
        # logging.warning('Create graveyard, places does not exist.')
        break

    for place in all_places:
        if not place['is_busy']:
            continue

        update_tree_status = {
            'tree_status': get_tree_status()
        }

        # logging.debug(f'Tree {place["id"]} is {update_tree_status["tree_status"]} now.')

        place_url = 'http://localhost:8000/api/places/' + str(place['id']) + '/'
        requests.put(place_url, update_tree_status)

        time.sleep(1)
    time.sleep(1)
