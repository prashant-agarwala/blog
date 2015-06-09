When(/^I go to the new user registration page$/) do
  visit "/users/sign_up"
end

When(/^I fill in the new user form with email "(.*?)", password "(.*?)" and password confirmation "(.*?)"$/) do |arg1, arg2, arg3|
 within("#new_user")do
    fill_in 'Email', :with => arg1
    fill_in 'Password', :with => arg2
    fill_in 'Password confirmation', :with => arg3
 end
end

When(/^I submit the form$/) do
  click_button 'Sign up'
end

Then(/^I should be on the dashboard page$/) do
  page.has_selector?('h1','Dashboard')
end

Then(/^I should see the 'dashboard' contents$/) do
  page.has_selector?('p','Find me in app/views/dashboard/index.html.erb')
end

Then(/^I should be on the new user registration page$/) do
  page.has_selector?('h2','Sign up')
  #page.should have_css('div#user_email.field')
  #find_field('Email').value.should eq "bob@example.com"
end

Then(/^I should see an error message$/) do
  #expect(page).to have_content "Sign up 1 error prohibited this user from being saved: Password confirmation doesn't match Password Email Password (8 characters minimum) Password confirmation Log in"
  #expect(page).to have_content "error prohibited this user from being saved"
  #page.should have_css('div#error_explanation')

end

Given(/^a user with email "(.*?)" and password "(.*?)"$/) do |arg1, arg2|
  @user = User.new(:email => arg1, :password => arg2, :password_confirmation => arg2)
  @user.save
end

When(/^I sign in manually as "(.*?)" with password "(.*?)"$/) do |arg1, arg2|
    visit "/users/sign_in"
    within("#new_user")do
       fill_in 'Email', :with => arg1
       fill_in 'Password', :with => arg2
    end
end

Then(/^I should be on user sign_in page$/) do
  page.has_selector?('h2','Log in')
end

Given(/^I am signed in as "(.*?)" with password "(.*?)"$/) do |arg1, arg2|
  visit "/users/sign_in"
  within("#new_user")do
     fill_in 'Email', :with => arg1
     fill_in 'Password', :with => arg2
  end
end

Given(/^I click on my name in the header$/) do
#  within("div#header.header")do
#    click_on('username')
#  end
end

Given(/^I follow "(.*?)"$/) do |arg1|
  within("div#header.header")do
    click_on('Log out')
  end
end

Then(/^I should be on the home page$/) do
  visit "/users/sign_in"
end
