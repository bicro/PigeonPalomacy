# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
      
    when /^the home\s?page$/ then '/'
    when /^the signup page$/ then '/users/sign_up'
    when /^the signin page$/ then '/users/sign_in'
    when /^the users page$/ then '/users'  
    when /^the admin page$/ then '/admin'
    when /^the admin login page$/ then '/admin/login'
    when /^the survey page$/ then "/"
    when /^the edit page$/ then "/users/edit"
    when /^the admin new question page$/ then "/admin/questions/new"
    when /^the settings page$/ then "/admin/settings"

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
