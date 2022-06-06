class HelloController < ApplicationController
    def hello
        render json: 'Hello World!', status: 200
    end
end
