library(tidyverse)
######## Part 1 ########
curr_tbl <- tibble(
artist = character(),
album = character(),
song = character(),
overall_loudness = numeric(),
spectral_energy = numeric(),
dissonance = numeric(),
pitch_salience = numeric(),
bpm = numeric(),
beats_loudness = numeric(),
danceability = numeric(),
tuning_frequency = numeric()
)
current_filename <- "The Front Bottoms-Talon Of The Hawk-Au Revoir (Adios).json" 
json_file <- fromJSON(current_filename)