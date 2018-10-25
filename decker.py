#!/usr/bin/env python
# Convert Arjuna CSV to a dict of cards.
import csv
import json

def main(reader):
    """Render a list of card dicts as a JSON deck."""  
    ids = set()
    cards = {}
    for row in reader:
        letter = row['Letter']
        cards[letter] = row # index by letter
        ids.add(letter[0])

    deck = []
    for letter in ids:
        deck += [{
            'id': letter,
            'front': render(cards[letter]),
            'back': render(cards[letter + letter]),
            'flipped': False,
        }]
    print json.dumps(deck, indent=2)


def render(card):
    """Based on the npdata.csv headers."""
    return {
        'flip': card['Flip'],
        'exec': card['Trigger'],
        'raj': {
            'action': card['RajAct'],
            'mods': card['RajText'],
            'limit': card['RajNum'],
        },
        'inc': {
            'action': card['INCAct'],
            'mods': card['INCText'],
        },
        'ml': {
            'action': card['MLAct'],
            'mods': card['MLText'],
        },
        'rev': {
            'action': card['RevAct'],
            'mods': card['RevText'],
            'limit': card['RevNum'],
        },
    }


if __name__ == '__main__':
    with open('npdata.csv') as csvfile:
        reader = csv.DictReader(csvfile)
        main(reader)
