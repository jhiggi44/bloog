# frozen_string_literal: true

class PostsController < ApplicationController
  def create
    creator_id = params[:creator_id]
    post = params[:post]
    redirect_to "/creators/#{creator_id}" if Post.new(creator_id: creator_id, title: post[:title], content: post[:content]).save
  end

  def new
    @creator = Creator.find(params[:creator_id])
    @post = Post.new(creator_id: @creator.id)
  end
end
