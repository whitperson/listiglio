class HomeController < ApplicationController
  require 'open-uri'

  def index
  end

  def add_url
    item_url = params[:item_url]
    doc = Nokogiri::HTML(open(item_url))
      if item_url.include?('etsy.com')
        get_etsy_info(doc)
      elsif item_url.include?('amazon.com')
         get_amazon_info(doc)
      else item_url.include?('jcrew.com')
         get_jcrew_info(doc)
      end
    redirect_to root_path
  end

  def get_etsy_info(doc)
    name = doc.css("div#item-title")[0].css("h1")[0].children().text
    photo = doc.css("div#fullimage_link1")[0].children()[0]['href']
    price = doc.css("div.item-amount").css("span.currency-value")[0].text
    newitem = Item.create(:name => name, :price => price, :remote_photo_url => photo)
  end

  def get_amazon_info(doc)
    name = doc.at_css("title").text
    price = doc.css("b.priceLarge").children().text.gsub("$"," ")
    photo = doc.css("#prodImage")[0]["src"]
    newitem = Item.create(:name => name, :price => price, :remote_photo_url => photo)
  end

  def get_jcrew_info(doc)
    name = doc.at_css("title").text
    photo = doc.at_css(".prod_main_img img")["src"]
      if doc.css("span.select-sale-single")
        doc.css("span.select-sale-single").children()[0].text.gsub("$"," ")
      elsif doc.css("span.price").empty?
        price = doc.css("span.price-single").children()[0].text.gsub("$"," ")
      else
        price = doc.css("span.price").children()[0].text.gsub("$"," ")
      end
    newitem = Item.create(:name => name, :price => price, :remote_photo_url => photo)
  end

end