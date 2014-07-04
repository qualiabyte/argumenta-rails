class WelcomeController < ApplicationController
  def index
    @arguments = Argument.all.limit(20)
  end
end
