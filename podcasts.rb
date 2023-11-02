require 'open-uri'
require 'fileutils'

def get_mp3_from_url
  @source = URI.open("#{ARGV[0]}").read.gsub("\n", '') # parser argument for dowload file from https://podcasts.google.com/

  start_title = 'class="e3ZUqe" role="presentation">'
  end_title = '<'
  article_titles = @source.scan(/(?<=#{ start_title }).*?(?=#{ end_title })/).flatten

  start_link = 'Kwyn5e;'
  end_link = ';'
  article_links = @source.scan(/(?<=#{ start_link }).*?(?=#{ end_link })/).flatten

  @articles = Hash[article_titles.zip(article_links)]
end

def download_mp3_file
  directory_name = 'podcasts'
  if !File.exists?(directory_name)
    FileUtils.mkdir(directory_name)
  else
    FileUtils.rm_rf(Dir.glob("#{directory_name}/*"))
  end

  ARGV.each do|number|
    @articles.first(number.to_i).each do |title, link| # parser argument for limit number of download articles
      open("#{directory_name}/#{title}.mp3", 'wb') do |file|
        file << URI.open("#{link}").read
      end
    end
  end
end

get_mp3_from_url
download_mp3_file
# Run ruby file in Terminal with syntax: ruby podcasts.rb <url> <number_of_articles>
