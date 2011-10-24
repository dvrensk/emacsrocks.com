# -*- coding: utf-8 -*-

class Episodes
  def self.all
    @@all ||= find_all
  end

  def self.find_all
    [
     Episode.new(:number => "01", :name => "From var to this", :size => "21mb", :youtube => "O0UgY-DmFbU"),
     Episode.new(:number => "02", :name => "A vimgolf eagle", :size => "30mb", :youtube => "dE2haYu0co8"),
     Episode.new(:number => "03", :name => "A vimgolf albatross", :size => "14mb", :youtube => "ePIHUfFz8-c"),
     Episode.new(:number => "04", :name => "A rebind controversy", :size => "14mb", :youtube => "OA0AjzBgWU4")
    ]
  end

  def self.next(episode)
    all[all.index(episode) + 1]
  end
end

class Episode
  attr_reader :number, :youtube, :size, :name

  def initialize(params)
    @number, @youtube, @size, @name = params[:number], params[:youtube], params[:size], params[:name]
  end

  def next
    Episodes.next(self)
  end

  def title
    "episode #{@number}"
  end

  def disqus_identifier
    "episode#{@number}"
  end

  def link
    "/e#{@number}.html"
  end

  def dropbox_link
    "http://dl.dropbox.com/u/3615058/emacsrocks/#{filename}"
  end

  def filename
    "emacs-rocks-#{@number}.mov"
  end

end
