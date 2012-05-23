# -*- coding: utf-8 -*-

module Episodes
  def self.all
    @all ||= find_all
  end

  def self.find_all
    [
     Episode.new(:number => "01", :name => "From var to this",     :time => Time.utc(2011, "oct", 21), :size => "21mb", :youtube => "O0UgY-DmFbU", :commands => ["string-rectangle", "isearch-forward"]),
     Episode.new(:number => "02", :name => "A vimgolf eagle",      :time => Time.utc(2011, "oct", 21), :size => "30mb", :youtube => "dE2haYu0co8", :commands => ["kmacro-start-macro", "digit-argument"]),
     Episode.new(:number => "03", :name => "A vimgolf albatross",  :time => Time.utc(2011, "oct", 22), :size => "14mb", :youtube => "ePIHUfFz8-c", :commands => ["transpose-lines", "transpose-chars", "kmacro-start-macro", "digit-argument"]),
     Episode.new(:number => "04", :name => "A rebind controversy", :time => Time.utc(2011, "oct", 24), :size => "14mb", :youtube => "OA0AjzBgWU4", :commands => ["iy-go-to-char", "downcase-word", "transpose-words"]),
     Episode.new(:number => "05", :name => "Macros in style",      :time => Time.utc(2011, "oct", 26), :size => "12mb", :youtube => "o1jJS_aibPA", :commands => ["forward-list", "kmacro-start-macro"]),
     Episode.new(:number => "06", :name => "Yeah! Snippets!",      :time => Time.utc(2011, "nov", 2),  :size => "8mb",  :youtube => "1W66B3CHaUo", :commands => ["yas-expand"]),
     Episode.new(:number => "07", :name => "Mind. Exploded.",      :time => Time.utc(2011, "nov", 9),  :size => "14mb", :youtube => "NXTf8_Arl1w", :commands => ["key-chord-define-global"]),
     Episode.new(:number => "08", :name => "mark-multiple",        :time => Time.utc(2011, "nov", 22), :size => "12mb", :youtube => "r2o9HYi7DOY", :commands => ["mark-next-like-this", "rename-sgml-tag", "inline-string-rectangle"]),
     Episode.new(:number => "09", :name => "expand-region",        :time => Time.utc(2012, "jan", 25), :size => "16mb", :youtube => "_RvHz3vJ3kA", :commands => ["expand-region"]),
     Episode.new(:number => "10", :name => "Jumping around",       :time => Time.utc(2012, "apr", 10), :size => "23mb", :youtube => "UZkpmegySnc", :commands => ["ace-jump-mode", "ido-imenu"])
    ]
  end

  def self.next(episode)
    all[all.index(episode).next]
  end
end

class Episode
  attr_reader :number, :youtube, :size, :name, :commands, :time

  def initialize(params)
    @number, @youtube, @size, @name, @commands, @time = params[:number], params[:youtube], params[:size], params[:name], params[:commands], params[:time]
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
