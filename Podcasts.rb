require 'nokogiri'
require 'open-uri'

module Podcasts
  class Episode
    attr_accessor :title, :author, :url, :image, :date
    def initialize title:, author:, url:, image:, date:
      @title = title
      @author = author
      @url = url
      @image = image
      @date = date
    end
  end

  class Feed
    attr_accessor :title, :author, :image, :url, :items

    def initialize url
      @url = url
      @items = Array.new

      feed = Nokogiri::XML(open(@url))
      @title = feed.xpath('//channel/title').text
      @author = feed.xpath('//channel/itunes:author').text
      @image = feed.xpath('//channel/itunes:image/@href').text
      feed.xpath('//channel/item').each do |item|
        @items << Episode.new(title: item.xpath('title').text,
          author: item.xpath('itunes:author').text,
          url: item.xpath('enclosure/@url').text,
          image: item.xpath('itunes:image/@href').text,
          date: item.xpath('pubDate').text)
      end

    end
  end
end
