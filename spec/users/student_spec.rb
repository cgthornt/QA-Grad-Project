require "spec_helper"

describe 'Student' do

  # Base xpath for the last quiz path
  let(:last_quiz_path) { "//div[@class='page']/table/tbody/tr[last()]" }
  let(:last_quiz_link) { "#{last_quiz_path}/td/a[1]" }

  # Before all tests, create a question
  before :all do
    require 'professor_helper'
    login_as :professor
    create_question
    reset!
  end

  # After all tests, delete the last question (i.e. clean up!)
  after :all do
    require 'professor_helper'
    login_as :professor
    delete_last_question
    reset!
  end

  before :each do
    login_as :student
    go 'takeQuiz.php'
  end

  context 'quiz was created' do

    # Basically we should be able to click on "Quiz 30" or whatever it is
    it 'should view possible to take' do
      item = element(xpath: last_quiz_link)
      item.exist?.should be_true
    end

    it 'should show a confirm dialog if clicked' do
      link(xpath: last_quiz_link).click
      browser.alert.exists?.should be_true
      browser.alert.close  # MUST CLOSE IT WITHOUT ACCEPTING!
    end
  end


  # ALL TESTS DEPEND ON THE ORDER, unfortunately :<
  context 'take the quiz' do

    it 'should be able to take the quiz' do
      link(xpath: last_quiz_link).click
      browser.alert.ok
      radio(value: '3').set
      btn(:submitQuiz).click

      # We expect a 100%
      browser.text.should include("Thank you for taking the quiz!")
    end

    it 'should show the results' do
      # Should show as having being taken
      element(xpath: "#{last_quiz_path}/td[2]").text.should include("YES")
      element(xpath: "#{last_quiz_path}/td[3]").text.should include("100%")
    end

  end

end