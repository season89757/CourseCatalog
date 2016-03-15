desc "Import courses."
require 'json'
task :import_courses =>:environment do
  file = File.read('course.json')
  data_hash = JSON.parse(file)
  i=0
  while i < data_hash.length
    name = data_hash[i]["name"]
    c = Course.new(:name => name)
    c.save
    i += 1
  end
end
