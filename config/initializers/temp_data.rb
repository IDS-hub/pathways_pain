# Load custom configuration variables

DATA = YAML.load_file(Rails.root.join('config/temp_data.yml'))[Rails.env]
