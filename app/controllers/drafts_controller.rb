# frozen_string_literal: true

class DraftsController < ApplicationController
  def create
   redirect_to "/creators/#{params[:creator_id]}" if Draft.new(title: params[:title], content: params[:content])
  end

  def new;end
end
