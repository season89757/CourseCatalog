desc "Import subjects."
require 'json'
task :import_subjects =>:environment do
  file = File.read('subject.json')
  data_hash = JSON.parse(file)
  i=0
  while i < data_hash.length
    name = data_hash[i]["name"]
    c = Subject.new(:name => name)
    c.save
    i += 1
  end
end
