library(tidyverse)
######## Part 1 ########
current_filename <- "The Front Bottoms-Talon Of The Hawk-Au Revoir (Adios).json" 
json_file <- fromJSON(current_filename)
file_parts <- str_split_fixed(current.filename, "-", 3) |> 
str_replace("\\.json$", "")
artist <- file_parts[1]
album <- file_parts[2]
song <- file_parts[3]
overall_loudness = pluck(json_data, "lowlevel", "loudness_ebu128", "integrated")
spectral_energy = pluck(json_data, "lowlevel", "spectral_energy")
dissonance = pluck(json_data, "lowlevel", "dissonance")
pitch_salience = pluck(json_data, "lowlevel", "pitch_salience")
bpm = pluck(json_data, "rhythm", "bpm"),
beats_loudness = pluck(json_data, "rhythm", "beats_loudness")
danceability = pluck(json_data, "rhythm", "danceability")
tuning_frequency = pluck(json_data, "tonal", "tuning_frequency")

########Part 2########

library(tidyverse)
library(jsonlite)

# Get JSON files
json_files <- list.files(path = "EssentiaOutput/", pattern = "\\.json$", full.names = TRUE)

# Function to extract data from a single JSON file
extract_essentia_data <- function(file_path) {
  file_name <- basename(file_path)
  file_parts <- str_split(file_name, "-", simplify = TRUE)
  
  if (length(file_parts) < 3) return(NULL)  # Handle unexpected file naming
  
  artist <- file_parts[1]
  album <- file_parts[2]
  song <- str_replace(file_parts[3], ".json$", "")
  
  json_data <- fromJSON(file_path)
  
  tibble(
    artist = artist,
    album = album,
    song = song,
    overall_loudness = pluck(json_data, "lowlevel", "loudness_ebu128", "integrated", .default = NA),
    spectral_energy = pluck(json_data, "lowlevel", "spectral_energy", .default = NA),
    dissonance = pluck(json_data, "lowlevel", "dissonance", .default = NA),
    pitch_salience = pluck(json_data, "lowlevel", "pitch_salience", .default = NA),
    bpm = pluck(json_data, "rhythm", "bpm", .default = NA),
    beats_loudness = pluck(json_data, "rhythm", "beats_loudness", .default = NA),
    danceability = pluck(json_data, "rhythm", "danceability", .default = NA),
    tuning_frequency = pluck(json_data, "tonal", "tuning_frequency", .default = NA)
  )
}

# Process all JSON files and combine into a single tibble
essentia_df <- map_dfr(json_files, extract_essentia_data)

################################################################################
# Step Three
################################################################################