require "bundler/setup"

require "sinatra/base"
require "pg"
require "redis"
require "uri"

class App < Sinatra::Application
  set :environment, :production  # we only care about status codes

  get '/postgres' do
    uri = URI.parse(ENV['DATABASE_URL'])
    conn = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
    conn.exec("SELECT * FROM pg_catalog.pg_tables")
    "hello, from postgres"
  end

  get '/redis' do
    uri = URI.parse(ENV['REDIS_URL'])
    r = Redis.new(host: uri.hostname, port: uri.port, password: uri.password, db: 0)
    r.ping
    "hello, from redis"
  end

  get '/http' do
    'hello, world!'
  end
end

run App
