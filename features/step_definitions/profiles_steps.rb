Given(/^following users exist:$/) do |table|
  # table is a Cucumber::Ast::Table
  #pending # express the regexp above with the code you wish you had
  data = table.hashes
  data.each do |ihash|
    #ihash[:email],ihash[:firstname],ihash[:lastname]
    Helper_methods.create_user(ihash[:email],'secret123')
    #Helper_methods.create_profile(ihash[:email],ihash[:first_name],ihash[:last_name])
    Helper_methods.update_profile(ihash[:email],ihash[:first_name],ihash[:last_name])

  end
end

Given(/^I sign in as "(.*?)"$/) do |arg1|
  #pending # express the regexp above with the code you wish you had
  step "I sign in manually as \"#{arg1}\" with password \"secret123\""
end

Then(/^I should see the following:$/) do |table|
  # table is a Cucumber::Ast::Table
  #@profile = Profile.find_by email: params[:email]
  #@profile = Profile.find_by email:"bob@example.com"
  #@profile = Profile.find_by email: curruser

  data = table.hashes
  data.each do |ihash|
    find_field('Email').value.should eq ihash[:email]
    find_field('First name').value.should eq ihash[:first_name]
    find_field('Last name').value.should eq ihash[:last_name]
  end
end

Given(/^I have the following saved posts:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had

end

When(/^I visit profile page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the following posts as draft:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Given(/^I have published posts$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a list my published posts as follows:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Given(/^I visit profile page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I click on "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^change my first name to "(.*?)" and last name to "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^I click on the "(.*?)" button$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be on my profile page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see my first name as "(.*?)" and last name as "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When(/^I click on "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be on the "(.*?)" page$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I set my new password as "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be redirected to sign_in page$/) do
  pending # express the regexp above with the code you wish you had
end
