require "spec_helper"

describe 'Login' do

  before :each do
    reset!
  end

  context 'with invalid credentials' do

    it 'has no username and password' do
      button(name: 'submit').click
      browser.text.should include('Login failed')
    end

    it 'has an invalid password' do
      admin = user :admin
      text_field(name: 'userName').set admin.username
      text_field(name: 'password').set 'zzzz'
      button(name: 'submit').click
      browser.text.should include('Login failed')
    end

    it 'has an invalid username' do
      admin = user :admin
      text_field(name: 'userName').set 'zzzz'
      text_field(name: 'password').set admin.password
      button(name: 'submit').click
      browser.text.should include('Login failed')
    end

    it 'should not accept SQL injections' do
      admin = user :admin
      text_field(name: 'userName').set admin.username
      text_field(name: 'password').set '1\' OR 1 = 1 -- '
      button(name: 'submit').click
      browser.text.should include('Login failed')
    end
  end

  context 'with valid credentials' do
    it 'should login as admin' do
      user = user(:admin)
      text_field(name: 'userName').set user.username
      text_field(name: 'password').set user.password
      button(name: 'submit').click
      browser.text.should_not include('Login failed')
    end

    it 'should login as a professor' do
      user = user(:professor)
      text_field(name: 'userName').set user.username
      text_field(name: 'password').set user.password
      button(name: 'submit').click
      browser.text.should_not include('Login failed')
    end

    it 'should login as student' do
      user = user(:student)
      text_field(name: 'userName').set user.username
      text_field(name: 'password').set user.password
      button(name: 'submit').click
      browser.text.should_not include('Login failed')
    end

  end

end
