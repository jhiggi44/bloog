# frozen_string_literal: true

class CreatorsController < ApplicationController
 def index;end
 def show
  @creator = Creator.find(params[:id])
 end
end