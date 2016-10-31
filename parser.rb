require 'nokogiri'
require 'open-uri'

class Parser
  def initialize
    @names = []
    @urls = []
  end

  def list_by_ingredient(ingredient)
    url = "http://www.jamieoliver.com/search/?s=#{ingredient}"

    html_doc = load_html(url)

    @names = html_doc.search('h2').map(&:text)
    @urls = html_doc.search('.recipe a').map{|a| a.attributes['href'].value}

    return @names
  end

  def import(index)
    url = @urls[index]
    html_doc = load_html(url)

    name = html_doc.search('h3.h1').text
    description = html_doc.search('ul.ingred-list li').map(&:text).map{|i| i.gsub(/\s+/, ' ')}.join(' / ')
    cook_time = html_doc.search('.recipe-detail.time').text.gsub('Cooks In','').strip
    difficulty = html_doc.search('.difficulty').text.gsub('Difficulty','').strip

    recipe = Recipe.new(name, description)
    recipe.cook_time = cook_time
    recipe.difficulty = difficulty
    return recipe
  end

  private

  def load_html(url)
    user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36'
    html_file = open(url, 'User-Agent' => user_agent).read
    Nokogiri::HTML(html_file)

  end
end