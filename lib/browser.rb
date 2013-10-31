# The browser! Woo
class Browser < Watir::Browser

  # Initializes a browser. If the browser is not set, defaults to the one in the config file.
  def initialize(browser = nil)
    super(browser || Settings.browser.to_sym)
  end

  def base_url
    @_base_url ||= Settings.site.base_url
  end

  # Links to a relative URL
  def go(relative_url)

    # Blank string if ':root'
    relative_url = '' if relative_url == :root

    # Remove leading slash
    relative_url.sub! '/', '' if relative_url[0] == '/'

    # Finally, go to it!
    goto "#{base_url}#{relative_url}"
  end

end