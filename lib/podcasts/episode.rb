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
end