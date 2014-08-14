require 'sinatra'
require 'cine_io'
require 'haml'

def cine
  @client ||= CineIo::Client.new(secretKey: ENV['CINE_IO_SECRET_KEY'])
end

get '/' do
  @project = cine.project.get
  @streams = cine.streams.index
  haml :project
end

get '/streams/create' do
  @stream = cine.streams.create
  redirect "/stream/#{@stream.id}"
end

get '/stream/:id' do
  @stream = cine.streams.get params[:id]
  haml :play_stream
end

get '/publish/:id' do
  @stream = cine.streams.get params[:id]
  haml :publish_stream
end
