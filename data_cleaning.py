import numpy as np
import pandas as pd

# geopy: Python client that enables locating the coordinates of addresses, cities, countries, and landmarks across the globe using third-party geocoders and other data sources
from geopy.geocoders import Nominatim
from geopy.extra.rate_limiter import RateLimiter

# pycountry_convert: extension of Python package pycountry providing conversion functionalities
import pycountry_convert as pc

from pprint import pprint
from typing import Tuple

# progress bar for Python
from tqdm import tqdm
tqdm.pandas()

# read data file for coordinates
site_df = pd.read_csv("original_dataset.csv")
# coord = site_df[["latitude", "longitude"]].values[4]

# # geopy geolocator
# locator = Nominatim(user_agent="<APP_NAME>")
# location = locator.reverse(str(coord[0]) + "," + str(coord[1]), language="en")
# print(location.raw["address"])


# dicionary = pc.map_countries(cn_name_format="default", cn_extras={})
# for key, value in dicionary.items():
#     print(key, ' : ', value)


US_states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennyslvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]

def get_continent(lat: float, lon:float, place:str) -> str:
    geolocator = Nominatim(user_agent="<username>@gmail.com", timeout=10)
    geocode = RateLimiter(geolocator.reverse, min_delay_seconds=0.25)

    location = geocode(f"{lat}, {lon}", language="en")

    # for cases where the location is not found (i.e. location is probably in the ocean)
    country = "None"
    convert_to_country_code = False
    if location is None:
        # split "place" string based on comma since "place" usually describes how far the earthquake is from a country
        if "," in place:
            place_split = place.split(", ")
            country = place_split[1]
            if country in US_states:
                country = "United States"
        if country == "None":
            return country
        else:
            convert_to_country_code = True
    
    # extract country code
    country_code = ""
    if convert_to_country_code == True:
        country_code = pc.country_name_to_country_alpha2(country, cn_name_format="upper")
    else:
        address = location.raw["address"]
        country_code = address["country_code"].upper()

    # get continent code from country code
    try:
        continent_code = pc.country_alpha2_to_continent_code(country_code)
        continent_name = get_continent_name(continent_code)
    except:
        print("Country code not in database")
        return "None"
    
    return continent_name

def get_continent_name(continent_code: str) -> str:
    continent_dict = {
        "NA": "North America",
        "SA": "South America",
        "AS": "Asia",
        "AF": "Africa",
        "OC": "Oceania",
        "EU": "Europe",
        "AQ" : "Antarctica"
    }
    return continent_dict[continent_code]

site_df[["continent"]] = site_df.progress_apply(
    lambda x: get_continent(x["latitude"], x["longitude"], x["place"]), axis=1, result_type="expand"
)
