# frozen_string_literal: true

class PostsController < ApplicationController
  def create
   redirect_to "/creators/#{params[:creator_id]}" if Post.new(title: params[:title], content: params[:content])
  end

  def new;end
end
