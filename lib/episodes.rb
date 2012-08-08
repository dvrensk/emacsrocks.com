# -*- coding: utf-8 -*-

module Episodes
  def self.all_normal
    @all_normal ||= find_all_normal
  end

  def self.all_extending
    @all_extending ||= find_all_extending
  end

  def self.all
    @all ||= (all_normal + all_extending).sort { |a, b| a.time <=> b.time }
  end

  def self.find_all_normal
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
     Episode.new(:number => "10", :name => "Jumping around",       :time => Time.utc(2012, "apr", 10), :size => "23mb", :youtube => "UZkpmegySnc", :commands => ["ace-jump-mode", "ido-imenu"]),
     Episode.new(:number => "11", :name => "swank-js",             :time => Time.utc(2012, "jul", 04), :size => "42mb", :youtube => "qwtVtcQQfqc", :commands => ["slime-js-send-defun", "slime-js-jack-in-node"])
    ]
  end

  def self.find_all_extending
    [
     ExtendingEpisode.new(:number => "01", :time => Time.utc(2012, "jun", 17), :size => "97mb",  :youtube => "5axK-VUKJnk", :commits => [{ :hash => "56e0b6e6", :msg => "Initial commit." }, { :hash => "e123fabe", :msg => "Tests up and running." }]),
     ExtendingEpisode.new(:number => "02", :time => Time.utc(2012, "jun", 17), :size => "129mb", :youtube => "Zxt-c_N82_w", :commits => [{ :hash => "b4a79c4e", :msg => "Implemented toggle-deffered." }]),
     ExtendingEpisode.new(:number => "03", :time => Time.utc(2012, "jun", 20), :size => "205mb", :youtube => "Dgcx5blog6s", :commits => [{ :hash => "f3fe2dd2", :msg => "Support hipster quotes." }, { :hash => "e83c3192", :msg => "Create a buster minor-mode." }]),
     ExtendingEpisode.new(:number => "04", :time => Time.utc(2012, "jun", 27), :size => "197mb", :youtube => "zI4KfUPRU5s", :commits => [{ :hash => "6fb1cf17", :msg => "Toggle without moving point." }, { :hash => "029eab32", :msg => "Autotest." }, { :hash => "bf7fd38a", :msg => "Remove bogus prose." }]),
     ExtendingEpisode.new(:number => "05", :time => Time.utc(2012, "jul", 1),  :size => "173mb", :youtube => "3-7nLXGf1Xg", :commits => [{ :hash => "f5af5d31", :msg => "Toggle focus rocket." }]),
     ExtendingEpisode.new(:number => "06", :time => Time.utc(2012, "aug", 8),  :size => "159mb", :youtube => "MrCSgAJJnc8", :commits => [{ :hash => "714872b",  :msg => "Run tests within Emacs." }])
    ]
  end

  def self.next(episode)
    index = all_normal.index(episode)
    return all_normal[index.next] if index
    index = all_extending.index(episode)
    return all_extending[index.next] if index
  end
end

class Episode
  attr_reader :number, :youtube, :size, :name, :commands, :commits, :time

  def initialize(params)
    @number = params[:number]
    @youtube = params[:youtube]
    @size = params[:size]
    @name = params[:name]
    @commands = params[:commands]
    @commits = params[:commits]
    @time = params[:time]
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

class ExtendingEpisode < Episode
  def disqus_identifier
    "extend-episode-#{@number}"
  end

  def link
    "/extend/e#{@number}.html"
  end

  def filename
    "extending-emacs-rocks-#{@number}.mov"
  end

  def title
    "#{@number}"
  end
end
