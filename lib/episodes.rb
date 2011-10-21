# -*- coding: utf-8 -*-

class Episodes
  def self.all
    @@all ||= find_all
  end

  def self.find_all
    [
     Episode.new(:number => '01', :youtube => 'O0UgY-DmFbU', :size => "21mb"),
     Episode.new(:number => '02', :youtube => 'dE2haYu0co8', :size => "30mb")
    ]
  end

  def self.next(episode)
    all[all.index(episode) + 1]
  end
end

class Episode
  attr_reader :number, :youtube, :size

  def initialize(params)
    @number, @youtube, @size = params[:number], params[:youtube], params[:size]
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
