Given /^I have no portfolios$/ do
  Portfolio.delete_all
end

Given /^I (only )?have portfolios titled "?([^\"]*)"?$/ do |only, titles|
  Portfolio.delete_all if only
  titles.split(', ').each do |title|
    Portfolio.create(:title => title)
  end
end

Then /^I should have ([0-9]+) portfolios?$/ do |count|
  Portfolio.count.should == count.to_i
end
