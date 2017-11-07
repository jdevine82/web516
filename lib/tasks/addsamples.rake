require 'csv'
namespace :addsamples do   
    task animals: :environment do

CSV.foreach("ICTWEB516_animals.csv", :headers => true, :col_sep => "\;") do |row|
  Animal.create!(row.to_hash)
  p row
end
end
end
