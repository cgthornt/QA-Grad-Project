require "spec_helper"

describe 'Professor' do

  before :all do
    login_as :professor
  end

  # For every time in this test, go to the addQuiz screen
  before :each do
    go 'addQuiz.php'
  end


  # A helper to select the open and close time of the add quiz screen. Takes two parameters, both of which
  # are Time objects.
  def set_date(open_time, close_time)
    set_date_sub open_time, 'o'
    set_date_sub close_time, 'c'
  end

  def set_date_sub(time, p)
    # Enter date attributes (month, day, year)
    dropdown("#{p}_year").select(time.year)
    dropdown("#{p}_month").select(Date::MONTHNAMES[time.month])
    dropdown("#{p}_day").select time.strftime('%d')

    # Hour, minute, AM/PM
    dropdown("#{p}_hour").select time.strftime('%I')

    # Coerce into minute 00
    dropdown("#{p}_min").select '00'
    dropdown("#{p}_ap").select time.strftime('%p')
  end


  it 'should submit with valid data' do
    set_date Time.now, Time.now + 1.month
    text_field(name: 'question1').set 'This is a sample question'
    text_field(name: 'exp1').set 'Select answer 3'
    text_field(name: 'a1').set '3'
    text_field(name: 'q1Choice1').set 'Invalid 1'
    text_field(name: 'q1Choice2').set 'Invalid 2'
    link(xpath: "//div[@class='add']/a[1]").click # Add a choice
    text_field(name: 'q1Choice3').set 'Correct'

    btn(:submit).click
    browser.text.should include('Quiz Added')

    go
  end


  # Ironically, the failure of this test makes it really hard to test -.-
  it 'should not submit without any input' do
    btn(:submit).click
    browser.text.should_not include('Quiz Added')
  end


end