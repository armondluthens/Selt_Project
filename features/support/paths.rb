module NavigationHelpers
  def path_to(page_name)
    case page_name
    
    when /home page/
        root_path
    when /deals page/
        deals_path
    when /restaurants page/
        restaurants_path  
    when /request account page/
        new_restaurant_path
    when /login page/ 
        login_path
    # Add more page name => path mappings here
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
      "Now, go and add a mapping in features/support/paths.rb"
    end
  end
end

World(NavigationHelpers)