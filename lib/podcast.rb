require 'rss/itunes'

class Podcast
  def self.base_uri
    "http://emacsrocks.com"
  end

  def self.build
    new.run.to_s
  end

  attr_reader :rss

  def run
    @rss = RSS::Rss.new("2.0")
    build_channel
    add_items
    rss
  end

  def build_channel
    channel = RSS::Rss::Channel.new

    channel.title = "Emacs Rocks!"
    channel.itunes_subtitle = channel.itunes_summary = channel.description =
      "Yes, emacs does rock. And here are some episodes to prove it."
    channel.link = self.class.base_uri
    channel.language = "en-us"
    channel.copyright = "Copyright #{Date.today.year} #{author}"
    channel.lastBuildDate = Time.now

    channel.itunes_author = author
    channel.itunes_owner = RSS::ITunesChannelModel::ITunesOwner.new
    channel.itunes_owner.itunes_name=author
    channel.itunes_owner.itunes_email='info@example.com'
    channel.itunes_explicit = "No"

    rss.channel = channel
  end

  def add_items
    episodes.each do |e|
      item = RSS::Rss::Channel::Item.new
      item.title = "Episode #{e.number}: #{e.name}"
      item.link = e.dropbox_link
      item.guid = RSS::Rss::Channel::Item::Guid.new
      item.guid.content = e.dropbox_link
      item.guid.isPermaLink = true
      item.pubDate = e.time

      item.description = e.commands.join(', ')
      item.itunes_summary = item.title
      item.itunes_subtitle = item.title
      item.itunes_explicit = "No"
      item.itunes_author = author

      # Based on the fact that episode 13 is 35 MB and 3:56 minutes
      duration = e.size.to_i * (3 * 60 + 56) / 35
      item.itunes_duration = RSS::ITunesItemModel::ITunesDuration.new(duration / 60, duration % 60)

      item.enclosure = RSS::Rss::Channel::Item::Enclosure.new(item.link, e.size.to_i * 1024 * 1024, 'audio/mpeg')
      rss.channel.items << item
    end
  end

  def episodes
    Episodes.all_normal.sort_by { |e| - e.time.to_i }
  end

  def author
    "Magnar Sveen"
  end
end
