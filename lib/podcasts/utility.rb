require 'httparty'
require 'nokogiri'

module Podcasts
  def self.get_feed_from_itunes url
    #extracts the source RSS URL from iTunes audio podcasts
    Nokogiri::HTML(
      HTTParty.post(
        "https://itunes.apple.com/WebObjects/DZR.woa/wa/viewPodcast?id=#{url.scan(/id(\d+)/).first.first}",
        headers: {'User-Agent' => 'iTunes/10.3.1 (Macintosh; Intel Mac OS X 10.6.8) AppleWebKit/533.21.1'})
    ).css('button').find{ |b| not b['feed-url'].nil? }['feed-url']
  end
end

