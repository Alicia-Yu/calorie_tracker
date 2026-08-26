require "dotenv/load"
require "net/http"
require "json"

class FoodsController < ApplicationController
  skip_authenticity_token only: [ :chat ]

  def chat
    message = params[:message]

    if message.blank?
      render json: { error: "No message provided" }, status: 400
      return
    end

    api_key = ENV["OPENAI_API_KEY"]

    if api_key.blank?
      render json: { error: "OpenAI API key not configured" }, status: 500
      return
    end

    begin
      uri = URI("https://api.openai.com/v1/chat/completions")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.read_timeout = 30

      request = Net::HTTP::Post.new(uri.path, { "Content-Type" => "application/json" })
      request["Authorization"] = "Bearer #{api_key}"

      request.body = JSON.generate({
        model: "gpt-3.5-turbo",
        messages: [
          {
            role: "system",
            content: "You are a helpful nutritionist and fitness assistant. Help users find information about food calories, protein, macros, and general nutrition advice. Keep responses concise and helpful. When asked about specific foods, provide accurate calorie and protein estimates per 100g or standard serving."
          },
          {
            role: "user",
            content: message
          }
        ],
        max_tokens: 500,
        temperature: 0.7
      })

      response = http.request(request)
      data = JSON.parse(response.body)

      if data["choices"] && data["choices"][0]
        reply = data["choices"][0]["message"]["content"]
        render json: { reply: reply }
      else
        render json: { error: data["error"]["message"] || "No response from API" }, status: 500
      end

    rescue => e
      render json: { error: e.message }, status: 500
    end
  end
end
