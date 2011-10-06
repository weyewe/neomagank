# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Neomagank::Application.initialize!


PROFICIENCY = {}
PROFICIENCY["1 -- Tahu sedikit"] = 1
PROFICIENCY["2"] = 2
PROFICIENCY["3"] = 3
PROFICIENCY["4 -- Penguasaan dasar"] = 4
PROFICIENCY["5"] = 5
PROFICIENCY["6"] = 6
PROFICIENCY["7 -- Sangat AHLI"] = 7

DEFAULT_PORTFOLIO_INDEX_IMAGE = "456x211-placeholder.jpg"
DEFAULT_PORTFOLIO_SHOW_IMAGE = "678x312-placeholder.jpg"