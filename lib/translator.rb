require 'pry'
require 'yaml'

def load_library(file_path)
  hash = {"get_meaning" =>{}, "get_emoticon" =>{}}
  YAML.load_file(file_path).each do |meaning, language_array|
    hash["get_emoticon"][language_array[0]] = language_array[1]
    hash["get_meaning"][language_array[1]] = meaning
  end
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  jp_emoticon = library["get_emoticon"][emoticon]
  if !jp_emoticon
    "Sorry, that emoticon was not found"
  else
    jp_emoticon
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  en_meaning = library["get_meaning"][emoticon]
  if !en_meaning
    "Sorry, that emoticon was not found"
  else
    en_meaning
  end
end