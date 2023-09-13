require 'uri'
require 'net/http'
require 'json'
require 'open-uri'
require 'nokogiri'

class Translator
  def initialize(source_language, target_language, api_key)
    @source_language = source_language
    @target_language = target_language
    @api_key = api_key

  end
  def change_source_lang(source_language)
    @source_language = source_language
  end

  def change_target_lang(target_language)
    @target_language = target_language
  end

  def view_code(language_name)
    code = view_code_all[language_name]
    code || "Language not found"
  end

  def view_code_all

    @url='https://rapidapi.com/dickyagustin/api/text-translator2/details'
    html = URI.open(@url)
    doc = Nokogiri::HTML(html)

    data = {}

    doc.css('table tr').each do |row|
      columns = row.css('td')
      if columns.size == 2
        language_name = columns[0].text.strip
        language_code = columns[1].text.strip
        data[language_name] = language_code
      end
    end
    data

  end


  def translate(text)
    url = URI("https://text-translator2.p.rapidapi.com/translate")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["content-type"] = 'application/x-www-form-urlencoded'
    request["X-RapidAPI-Key"] = @api_key
    request["X-RapidAPI-Host"] = 'text-translator2.p.rapidapi.com'
    request.body = "source_language=#{@source_language}&target_language=#{@target_language}&text=#{text}"

    response = http.request(request)
    translation_data = JSON.parse(response.read_body)

    translation_data.dig("data", "translatedText")
  end
end

