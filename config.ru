#\ -s puma
require 'bundler'
Bundler.require

Mongoid.load!('./config/mongoid.yml', :development)
Mongoid.logger.level = Logger::DEBUG

require './model/problem'

require './route/status_route'
require './route/problem_route'

require './controller/problem_controller'

ProblemController.init unless Problem.exists?

Faye::WebSocket.load_adapter('puma')

use Rack::Static,
    :urls => %w'/app /js /css /img /font /audio',
    :root => 'public'

run Rack::URLMap.new(
    '/status' => StatusRoute,
    '/problem' => ProblemRoute
)