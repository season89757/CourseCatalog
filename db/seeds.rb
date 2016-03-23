# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'
file1 = File.read('course.json')
course_data_hash=JSON.parse(file1)
i=0
while i < course_data_hash.length
  name = course_data_hash[i]["name"]
  id = course_data_hash[i]["id"]
  subjects = course_data_hash[i]["subjects"]
  c = Course.new(:name => name, :course_id=> id, :subjects=> subjects)
  c.save
  i += 1
end

file2 = File.read('subject.json')
subject_data_hash=JSON.parse(file2)
i=0
while i < subject_data_hash.length
  name = subject_data_hash[i]["name"]
  id = subject_data_hash[i]["id"]
  segments = subject_data_hash[i]["segments"]
  c = Subject.new(:name => name, :subject_id=> id, :segments=> segments)
  c.save
  i += 1
end

file3 = File.read('instructor.json')
instructor_data_hash=JSON.parse(file3)
i=0
while i < instructor_data_hash.length
  first = instructor_data_hash[i]["first"]
  last = instructor_data_hash[i]["last"]
  id = instructor_data_hash[i]["id"]
  c = Instructor.new(:first => first, :last=> last, :instructor_id=> id)
  c.save
  i += 1
end
