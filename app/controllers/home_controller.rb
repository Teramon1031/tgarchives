class HomeController < ApplicationController
  def top
    @projects = Project.all
  end
end
