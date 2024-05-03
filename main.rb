require 'sinatra'
require 'json'

data = ""
DataBase = "./DB/Sleds.json"
File.open(path=DataBase, mode="r") do |file|
  file.each do |text|
    data += text
  end
end
sleds_data = JSON.parse data

def save data
  File.open(path=DataBase, mode="w") do |file|
    file.write JSON.generate data
  end
end

set :port => 80
get "/js" do
  file_name = params[:q]
  send_file "./Web/js/#{file_name}.js"
end

get "/css" do
  file_name = params[:q]
  send_file "./Web/css/#{file_name}.css"
end

get "/" do
  puts "Access index"
  send_file "./Web/index.html"
end

post "/api/create-Sled" do
  Sled_name = params[:name]
  sleds = sleds_data.keys
  if sleds.include? Sled_name
    return "False"
  end
  sleds_data[Sled_name] = {
    "comments" => []
  }
  save sleds_data
  sleds = sleds_data.keys
  puts sleds
end

get "/api/sleds" do
  JSON.generate sleds_data.keys
end

post "/api/get_comments" do
  Sled_name = params[:name]
  puts "Sled: #{Sled_name}"
  sleds = sleds_data.keys
  unless sleds.include? Sled_name
    return "False"
  end

  comments = sleds_data[Sled_name]["comments"]
  comments.to_s
end

post "/api/send_comments" do
  Sled_name = params[:name]
  Comment = params[:value]
  sleds = sleds_data.keys

  unless sleds.include? Sled_name
    return "False"
  end

  sleds_data[Sled_name]["comments"] << Comment
  save sleds_data
  "True"
end

get "/Sleds" do
  send_file "./Web/Sleds.html"
end