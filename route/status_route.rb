class StatusRoute < Sinatra::Base
  get '/' do
    content_type :json
    {message: 'running'}.to_json
  end
end