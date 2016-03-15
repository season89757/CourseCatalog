desc "Import instructors."
require 'json'
task :import_instructors =>:environment do
  file = File.read('instructor.json')
  data_hash = JSON.parse(file)
  i=0
  while i < data_hash.length
    first = data_hash[i]["first"]
    last = data_hash[i]["last"]
    c = Instructor.new(:first => first,:last => last)
    c.save
    i += 1
  end
end
