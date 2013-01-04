class HomeController < ApplicationController

  def index
  end

  # require 'open-uri'
  #   doc = Nokogiri::HTML(open('http://news.ycombinator.com/newest'))
  #   links = doc.css('table table tr:nth-child(3n+1) td:nth-child(3) > a')
  #   links.each do |link|
  #     record = Link.where(:name => link.content, :url => link.get_attribute('href')).first
  #     Link.create(:name => link.content, :url => link.get_attribute('href')) if record.nil?
  #   end

  def add_url
    item_url = params[:item_url]
    raw_data = HTTParty.get("#{item_url}")
    binding.pry
  end

end