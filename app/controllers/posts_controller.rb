# frozen_string_literal: true

class PostsController < ApplicationController
  def create
    user_id = params[:user_id]
    post = params[:post]
    if Post.new(user_id: user_id, title: post[:title]).save
      redirect_to "/users/#{user_id}"
    end
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new(user_id: @user.id)
  end

  def show
    @post = Post.find(params[:id])
    @sections = @post.sections
  end
end
