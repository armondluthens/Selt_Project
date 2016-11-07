# Completed step definitions for basic features (Iteration 1): create restaurant account, login, logout
# create deal?

Given /^I am on the "(.*?)"$/ do |page|
    visit path_to(page)
end
 
Then /^I should see a restaurant account with name "(.*?)"$/ do |name| 
    result=false
    all("tr").each do |tr|
        if tr.has_content?(title) && tr.has_content?(rating)
            result = true
            break
        end
    end  
    expect(result).to be_truthy
end

When /^I click the "(.*?)" link/ do |link|
    click_link link
end 

When /^I click the "(.*?)" button/ do |button|
    click_button button
end 
 
Then /^I should be on the "(.*?)"$/ do |page|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page)
  else
    assert_equal path_to(page), current_path
  end
end 

Given /^I have filled out the request form with name "(.*?)", with email "(.*?)"$/ do |name, email|
   fill_in 'Restaurant Name', :with => name 
   fill_in 'Access Email', :with => email 
   click_button 'Request Account'
end
  
  
Then /^I should see a notice of "(.*?)"$/ do |notice|  
  page.should have_content notice
end 

Given /^I login with name "(.*?)", password "(.*?)"$/ do |name, pw|
   fill_in 'Account ID', :with => name 
   fill_in 'Account Password', :with => pw 
   click_button 'Login to my account'
end

Given /^the restaurant with name "(.*?)", password "(.*?)", email "(.*?)", invitationID "(.*?)"$/ do |name, password, email, invitationID|
    Restaurant.create!(:name => name, :password => password, :email => email, :invitationID => invitationID)
end