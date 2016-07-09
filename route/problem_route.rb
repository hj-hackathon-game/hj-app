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
      ProblemController.answer(req['id'], req['ans'], req['time']).to_json
    rescue BadRequestError => e
      status, body = 400, {result: 'Bad Request'}.to_json
    end
  end

  get '/predict' do
    content_type :json
    ProblemController.predict.to_json
  end
end