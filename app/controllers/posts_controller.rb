# frozen_string_literal: true

class PostsController < ApplicationController
  def create
    user_id = params[:user_id]
    post_details = params[:post]
    post = Post.create(user_id: user_id, title: post_details[:title])
    create_sections_of_post(post, post_details[:sections])

    redirect_to "/users/#{user_id}"
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new(user_id: @user.id)
  end

  def show
    @post = Post.find(params[:id])
    @sections = @post.sections
  end

  def create_sections_of_post(post, sections)
    sections.each_with_index do |section, index|
      Section.create(post: post, contents: section, position: index)
    end
  end
end
