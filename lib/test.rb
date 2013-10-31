

class Test < Minitest::Test
  # Our custom-defined assertions are here
  include Assertions

  attr_reader :browser

  alias_method :b, :browser

  def initialize
    super
    @browser = Browser.new
  end


end