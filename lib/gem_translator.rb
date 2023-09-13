require 'uri'
require 'net/http'
require 'json'

class Translator
  def initialize(source_language, target_language)
    @source_language = source_language
    @target_language = target_language
    @api_key = '3d9d26bb72mshdf0a46c346b0b91p143602jsn02e9b0d372b9'
  end
  def change_source_lang(source_language)
    @source_language = source_language
  end

  def change_target_lang(target_language)
    @target_language = target_language
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




