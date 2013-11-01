
class TestCase < ActiveSupport::TestCase
  # Our custom-defined assertions are here
  # include Assertions

  attr_reader :browser
  alias_method :b, :browser

  def setup
    @browser = Browser.new
    b.go :root
  end

  def teardown
    b.close
  end

  #def initialize
  #  super
  #  @browser = Browser.new
  #end


end