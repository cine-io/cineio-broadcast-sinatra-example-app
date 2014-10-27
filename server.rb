require "bundler"
Bundler.require

require 'sinatra'
require 'cine_io'
require 'haml'
require './cine_io_keys'

def cine
  @client ||= CineIo::Client.new(secretKey: CineIoKeys.secretKey)
end

get '/' do
  if CineIoKeys.secretKey
    @project = cine.project.get
    @streams = cine.streams.index
    @publicKey = CineIoKeys.publicKey
    haml :project
  else
    haml :not_configured
  end
end

get '/streams/create' do
  @stream = cine.streams.create
  redirect "/stream/#{@stream.id}"
end

get '/stream/:id' do
  @stream = cine.streams.get params[:id]
  @publicKey = CineIoKeys.publicKey
  haml :play_stream
end

get '/publish/:id' do
  @stream = cine.streams.get params[:id]
  @publicKey = CineIoKeys.publicKey
  haml :publish_stream
end
