class GoogleService
  attr_accessor :page, :links

  def initialize(search_term)
    @search_term = search_term.gsub(/[ ]/, '+')
    @base        = "https://www.google.com/"
    @agent       = Mechanize.new
    @agent.get(@base)
    @page
    @links = submit_search
  end

  def submit_search
    @page = @agent.page
    @page.forms.first.fields[-2].value = @search_term
    @page.forms.first.submit
    @page = @agent.page
    first_link = @page.links.find do |x|
      x.uri.to_s.include?("search") &&
      x.uri.to_s.include?("url?")
    end
  end

  def get_link
    "https#{links.uri.to_s.split("https").last.split("%").first}"
  end

end
