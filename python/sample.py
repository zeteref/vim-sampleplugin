import requests
import json
import vim

def _get(url):
    return requests.get(url).text.strip()

def _get_country():
    ip = _get('http://ipinfo.io/ip')
    json_location_data = _get('http://api.ip2country.info/ip?%s' % ip)
    location_data = json.loads(json_location_data)
    return location_data['countryName']

def print_country():
    print('You seem to be in %s' % _get_country())


def insert_country():
    row, col = vim.current.window.cursor
    current_line = vim.current.buffer[row-1]
    new_line = current_line[:col] + _get_country() + current_line[col:]
    vim.current.buffer[row-1] = new_line
