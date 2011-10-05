puts "before the parsing"
TRANSLOADIT = YAML.load_file("#{Rails.root}/config/transloadit.yml")
puts "after the parsing"