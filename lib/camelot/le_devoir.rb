require 'rubygems'
require 'mechanize'

class LeDevoir
  def initialize(args={})
    parse_arguments(args)
  end
  
  def download_files
    login
    find_files
    @files.each do |path|
      filename = build_filename(path)
      @agent.get(path).save_as(filename) unless File.exists?(filename)
    end
  end
  
  def login
    @agent = Mechanize.new
    begin
      perform_login
    rescue SocketError
      # If there is no internet connection, try again in 30 seconds
      sleep 30
      perform_login
    end
  end
  
  def perform_login
    page = @agent.get('http://ledevoir.com')
    login_form = page.form_with(:action => "/auth/login")
    login_form["login[courriel]"] = @credentials[:email]
    login_form["login[password]"] = @credentials[:password]
    login_form.submit
  end
  
  def find_files
    @files = @agent.page.search("#edition_samedi a, .connexion a").map {|l| l['href'] if l['href'].match(/pdf$/)}.compact
  end
  
  def parse_arguments(args)
    if args.has_key?(:email) and args.has_key?(:password) and args.has_key?(:path)
      @credentials = Hash.new
      @credentials[:email] = args.delete(:email)
      @credentials[:password] = args.delete(:password)
      @path = args.delete(:path)
    else
      raise ArgumentError
    end
  end
  
  def build_filename(path)
    parts = path.split("/")
    suffix = parts[-2] == "edition-pdf" ? "" : "-#{parts[-2]}"
    File.join(@path, "#{parts.last.sub(/\.pdf/,'')}#{suffix}.pdf")
  end
end
