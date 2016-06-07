require 'nokogiri'
require 'open-uri'

module Podcasts
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
        image = item.xpath('itunes:image/@href').text
        image = @image if image.empty?
        @items << Episode.new(title: item.xpath('title').text,
          author: item.xpath('itunes:author').text,
          url: item.xpath('enclosure/@url').text,
          image: image,
          date: item.xpath('pubDate').text)
      end

    end
  end
end