require 'httparty'

class AddonApi

  include HTTParty

#  base_uri 'http://localhost:3000/accounts/11/todos'
  base_uri ENV['TODOSADDON_URL']
  format :json

  def self.access_token
    ENV['TODOSADDON_ACCESS_TOKEN']
#    "f1525ef2b18248fcf9f5bbd9f46eb2e6"
  end

  def self.headers
    {"Authorization"=>"Token token=\"#{access_token}\""}
  end

  def create(text)
    options = { :body=> {todo:{:text => text }}, headers: self.class.headers}
    response = self.class.post('', options)
    response.parsed_response
  end

  def index
    response = self.class.get('', headers: self.class.headers)
    response.parsed_response
  end

  def show(id)
    response = self.class.get("/#{id}", headers: self.class.headers)
    response.parsed_response
  end

  def destroy(id)
    response = self.class.delete("/#{id}", headers: self.class.headers)
    response.parsed_response
  end

  def update(id, text)
    options = { :body=> {todo:{:text => text }}, headers: self.class.headers}
    response = self.class.put("/#{id}", options)
    response.parsed_response
  end
end
