class TopController < ApplicationController
  def index
    if current_user
      @projects = current_user.projects.all
    end
  end

  def about
  end

end
