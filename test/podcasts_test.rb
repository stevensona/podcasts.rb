require 'test_helper'

class PodcastsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Podcasts::VERSION
  end

end

class TestEpisode < Minitest::Test
    def setup
      @episode = Podcasts::Episode.new title: 'Hardwell On Air 200',
        author: 'Hardwell',
        url: 'http://podcast.djhardwell.com/HardwellOnAir200.m4a',
        image: 'http://podcast.djhardwell.com/hoa200.jpg',
        date: 'Fri, 16 Jan 2015 21:59:59 GMT'
    end

    def test_episode_attrs
      assert_equal 'Hardwell On Air 200', @episode.title , 'title is correct'
      assert_equal 'Hardwell', @episode.author, 'author is correct'
      assert_equal 'http://podcast.djhardwell.com/hoa200.jpg', @episode.image ,'image url is correct'
      assert_equal 'http://podcast.djhardwell.com/HardwellOnAir200.m4a', @episode.url, 'feed url is correct'
      assert_equal 'Fri, 16 Jan 2015 21:59:59 GMT', @episode.date, 'date is correct'
    end
end

class TestPodcastHardwell < Minitest::Test
    def setup
      @feed = Podcasts::Feed.new 'http://podcast.djhardwell.com/podcast.xml'
    end

    def test_podcast_attrs
      assert_equal 'Hardwell On Air Official Podcast', @feed.title , 'title is correct'
      assert_equal 'Hardwell', @feed.author, 'author is correct'
      assert_equal 'http://podcast.djhardwell.com/hoa2015.jpg', @feed.image ,'image url is correct'
      assert_equal 'http://podcast.djhardwell.com/podcast.xml', @feed.url, 'feed url is correct'
      assert @feed.items.count > 0, 'there is more than one item in feed'
    end
end
