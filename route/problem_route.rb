class ProblemRoute < Sinatra::Base
  get '/' do
    content_type :json
    {message: 'running'}.to_json
  end

  get '/new' do
    content_type :json
    ProblemController.request.to_json
  end

  post '/answer' do
    content_type :json
    begin
      req = JSON.parse(request.body.read)
      ProblemController.answer(req['id'], req['ans'], req['time'])
    end
  end
end