Given(/^I click on the create post button$/) do
  within("div#header.header")do
    click_on('Create Post')
   end
end

When(/^I create a blog post as follows:$/) do |table|
  # table is a Cucumber::Ast::Table
  data = table.hashes
  data.each do |ihash|
    within("#new_post")do
       fill_in 'post_title', :with => ihash[:title]
       fill_in 'post_content', :with => ihash[:content]
    end
  end
end

When(/^I click on the save button$/) do
  within("#new_post")do
   click_on('Save')
  end
end

When(/^I go to the dashboard page$/) do
  within("div#header.header")do
    click_on('Home')
   end
end

Then(/^I should see "(.*?)" within "(.*?)"$/) do |arg1, arg2|
  expect(page).to have_selector("#{arg2} table tr td",arg1)
  #page.all(:xpath, '//a[@id="person_123"]')
  #page.find(:xpath, '//div[contains(., "bar")]')
  #page.should have_xpath(:xpath, "/#{arg2}")
  #page.should have_xpath(:xpath, "//div[@#{arg2}]")
  #page.should have_xpath("//table/tr[td//text()[contains(., #{arg1})]")
  #page.should have_xpath("//table/tr/td",:text => arg1)
  page.should have_xpath("//table//tr/td[1]",:text => arg1)
  #page.should have_xpath("//table//tr[td//text()[contains(., #{arg1})]")
  #find(:xpath, "//tr[td[contains(.,arg1)]]/td/a", :text => 'Edit').click 

  #page.should have_xpath("//table//tr[td[1]=#{arg1}]")
  #page.should have_xpath("//table//tr[td[contains(#{arg1},#{arg1})]]")
  #page.should have_xpath("//table//tr//td[contains(.,#{arg1})]")
  #page.should have_xpath("//table//tr//td[contains(text(),#{arg1})]")


  #page.find(:xpath, "//table//tr/td[1]",:text => arg1).click
  #page.find(:xpath, "//table//tr/td[1]",:text => arg1).click
  #page.should have_xpath("//table//tr[ contains(td,#{arg1})]")


  #page.find('li', :text => 'Quox').click_link('Delete')
  #page.find(:xpath, "//table//tr/td[1]")

  #page.should have_xpath("#{arg2}//table//td")

  #page.should have_xpath(:xpath, '//div[contains(., "bar")]')

  #page.should have_xpath(:xpath, "//div[@#{arg2}]//table//td[text() = arg1]")
end

Then(/^I should be on the post titled "(.*?)"$/) do |arg1|
  #expect(page).to have_selector("Title",text: arg1)
  #within("#Title")do
   #expect(page).to have_content match arg1

  #end
  #expect(page).to have_selector('Title',arg1)
  #expect(page).to have_selector('Title',text: arg1)

end

Then(/^I should see the post content "(.*?)"$/) do |arg1|
  #pending # express the regexp above with the code you wish you had
end

Given(/^the following posts exist:$/) do |table|
  # table is a Cucumber::Ast::Table
  data = table.hashes
  data.each do |ihash|
    #ihash[:title],ihash[:content]
    #step "I go to the dashboard page"
    step "I click on the create post button"
    within("#new_post")do
       fill_in 'post_title', :with => ihash[:title]
       fill_in 'post_content', :with => ihash[:content]
    end
    step "I click on the save button"
  end
end

Then(/^I should see "(.*?)" as the first post within "(.*?)"$/) do |arg1, arg2|
  within(arg2)do
    row1 = page.all("table tr")[1]
    col = row1.all("td")[0]
  #  expect(arg1).to eq(col.text)
  end
end

Then(/^I should not see "(.*?)" post in my dashboard$/) do |arg1|
  rows = page.all("table tr")
  if rows.count > 1 then
    rows.each do |tr|
       title = tr.all("td")[0]
       #puts title
       if (title != nil) then
        expect(title.text).not_to be == arg1
       end
    end
  end
end

Given(/^I am on my dashboard$/) do
  click_on('Home')
end

Given(/^I have a blog post titled "(.*?)"$/) do |arg1|
  step "I click on the create post button"
  within("#new_post")do
     fill_in 'post_title', :with => arg1
     fill_in 'post_content', :with => "Random Content"
  end
  step "I click on the save button"
  step "I am on my dashboard"
end

Given(/^I choose to delete the post titled "(.*?)"$/) do |arg1|
  #find(:xpath, "//tr[td[contains(.,arg1)]]/td/a", :text => 'Edit').click
  rows = page.all("table tr")
  #  for tr in 1 ... rows.size
  #     title = tr.all("td")[0]
  #     #puts title
  #     if title.text == arg1 then
  #       puts arg1
  #       puts tr.all("td")[1]
  #       puts tr.text
  #  #     click_on()
  #     end
  #  end
     puts rows.size
    (1...rows.size).each{|i|
      title = rows[i].all("td")[0]
      if title.text == arg1 then
        puts rows[i].all("td")[4]
        click_on(rows[i].all("td")[4].text)
      end
    }
  #  page.all('Destroy')[1].click

end

Given(/^I go to my dashboard$/) do
  click_on('Home')
end


Given(/^I choose to edit the post titled "(.*?)"$/) do |arg1|
    click_on('Home')
    rows = page.all("table tr")
     puts rows.size
    (1...rows.size).each{|i|
      title = rows[i].all("td")[0]
      if title.text == arg1 then
      #  click_on(rows[i].all("td")[4].text)
        puts rows[i].all("td")[3].text
        click_on(rows[i].all("td")[3].text)
      end
    }
end

Then(/^I should be on the edit post page$/) do
  page.has_selector?('h1','Editing Post')
end

Then(/^I change the title to "(.*?)"$/) do |arg1|
  #within("#edit_post")do
     fill_in 'post_title', :with => arg1
  #end
end

Then(/^I should be on "(.*?)" page$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the post titled "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I change the content of the post to "(.*?)"$/) do |arg1|
  fill_in 'post_content', :with => arg1
end

Then(/^I should click on "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the content of the post as "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the author of the post as "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
