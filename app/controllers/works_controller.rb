class WorksController < ApplicationController

   def index
    @works = Work.all
    #byebug
  end

end
