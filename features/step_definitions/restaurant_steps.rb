# Completed step definitions for basic features (Iteration 1): create restaurant account, login, logout
# create deal?

Given /^I am on the IowaCityEats home page$/ do
  visit root_path
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