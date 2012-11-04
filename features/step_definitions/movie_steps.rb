Given /^the following movies exist:$/ do |table|
 table.hashes.each do |movie|
    if not Movie.find_by_id(movie[:title])
     Movie.create!(movie)
    end
 end
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |arg1, arg2|
  assert Movie.find_by_title(:arg1) == Movie.find_by_director(:arg2) && page.body =~ /#{arg1}.+Director.+#{arg2}/m
end

