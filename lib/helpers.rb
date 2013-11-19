require 'ostruct'

module Helpers
  extend ActiveSupport::Concern

  # Resets the browser session without actually closing the browser. Clears cookies
  def reset!
    browser.cookies.clear
    home!
  end

  # Navigates to the root URL
  def home!
    goto Settings.site.base_url
  end

  # Gets a User object, with the username/password combination contained in the application
  def user(id)
    return OpenStruct.new(Settings.users[id])
  end

  # Attempts to automatically log in as a specific user type
  def login_as(type)
    home!
    user = self.user(type)
    text_field(name: 'userName').set user.username
    text_field(name: 'password').set user.password
    button(name: 'submit').click
    browser.text.should_not include('Login failed')
  end

end