require 'builder'

module Atom
  def self.base_uri
    "http://emacsrocks.com"
  end

  def self.build
    atom = Builder::XmlMarkup.new(:indent => 2)
    atom.instruct!
    atom.feed "xmlns" => "http://www.w3.org/2005/Atom" do |variable|
      atom.id "urn:emacsrocks-com:feed"
      atom.updated Episodes.all_normal[-1].time.iso8601(0)
      atom.title "Emacs Rocks!", :type => "text"
      atom.link :rel => "self", :href => "#{base_uri}/atom.xml"
      Episodes.all_normal[-10..-1].reverse.each do |episode|
        atom.entry do
          atom.title "#{episode.number}: #{episode.name}"
          atom.updated episode.time.iso8601(0)
          atom.author { atom.name "Magnar Sveen" }
          atom.link "href" => "#{base_uri}/#{episode.link}"
          atom.id "urn:emacsrocks-com:feed:episode:#{episode.number}"
          atom.content episode.commands.join(', '), :type => "text"
        end
      end
    end
  end
end
