# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

CSV.foreach("lib/seeds/strongs.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
	Strong.create(row.to_hash)
end

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'strongs.csv'))
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
# 	t = Transaction.new
# 	t.strong_id = row['StrongID']
# 	t.lemma = row['lemma']
# 	t.xlit = row['xlit']
# 	t.pronounce = row['pronounce']
# 	t.description = row['description']
# 	t.part_of_speech =row['PartOfSpeech']
# 	t.language = row['Language']
# 	t.save
# 	puts "#{t.strong_id}, #{t.lemma} saved"
# end

# puts "There are now #{Transaction.count} rows in the transactions table"
