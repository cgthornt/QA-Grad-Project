require "spec_helper"

describe 'Admin' do

  before :all do
    login_as :admin
  end

  before :each do
    go 'AdministratorHome.php'
  end



  it 'should manage accounts' do
    button(value: 'Manage Accounts').click
    button(value: 'Add Account').click

    # Fill out the form
    text_field(name: 'userName').set 'TestAccount'
    text_field(name: 'password').set '1111qqqq'
    text_field(name: 'firstName').set 'Smokey'
    text_field(name: 'lastName').set 'Gilmore'
    radio(value: 'administrator').set
    text_field(name: 'email').set 'example@example.com'
    button(value: 'Add User').click

    # Should have worked
    browser.text.should include('You have successfully created the account')

    # Clean up
    button(value: 'Manage Accounts').click
    buttons(value: 'DELETE').last.click
    browser.text.should include('You have successfully deleted the account')
  end


  it 'should manage courses' do
    # View main "Manage Courses" page
    button(value: 'Manage Courses').click
    browser.text.should include('Manage Courses')

    # Add Course
    button(value: 'Add Course').click
    browser.text.should include('Add Course')

    # Enter form
    text_field(name: 'courseNumber').set '0000' # Ordered so should be first?
    text_field(name: 'shortTitle').set 'CSE'
    text_field(name: 'fullTitle').set 'QA & Testing'
    text_field(name: 'semester').set 'Fall'

    # Submit form
    button(value: 'Add Course').click
    browser.text.should include('You have successfully added the course')

    # Clean up
    button(value: 'Manage Courses').click
    buttons(value: 'DELETE').first.click
    browser.text.should include('You have successfully deleted the course')
  end

  it 'should manage users in courses' do
    # View "Manage Users in Courses" page
    button(value: 'Manage Users in Courses').click
    browser.text.should include('Manage Users In Courses')

    # Add admin to a course
    select_list(name: 'UserName').select 'shirlT'
    select_list(name: 'CourseNumber').select '12345'
    button(value: 'Add').click
    browser.text.should include('You have successfully added user')

    # Now remove him
    select_list(name: 'UserName').select 'shirlT'
    select_list(name: 'CourseNumber').select '12345'
    button(value: 'Delete').click
    browser.text.should include('You have successfully deleted the user')

  end



end