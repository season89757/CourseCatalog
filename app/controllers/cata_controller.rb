require 'pry-byebug'
class CataController < ApplicationController
  def index
    if params[:user_id]
      id = params[:user_id]
      @session = User.find(id)
    end
  end

  def register
    if params[:error] then @error = params[:error] end

    if params[:username]
      if params[:password] != params[:confirm]
        redirect_to cata_register_path(:error => "Passwords do not match")
      else
        user_exists = User.find_by(username:params[:username])
        email_exists = User.find_by(email:params[:email])
        if user_exists || email_exists
          redirect_to cata_register_path(:error => "User or Email already exists")
        else
          @user = User.create(username: params[:username], password: params[:password], email: params[:email], display_name: params[:display_name])
          session[:user_id]=@user.id
          redirect_to cata_index_path
        end
      end
    end
  end

  def login
    if params[:error] then @error = params[:error] end

    if params[:username]
      @user = User.find_by(username: params[:username], password: params[:password])
      if @user
        session[:user_id]=@user.id
        redirect_to cata_index_path
      else
        redirect_to cata_login_path(:error => "Wrong credentials")
      end
    end
  end

  def instructors
  end

  def courses
  end

  def subjects
  end

  def current_user
   @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    if logged_in? then session[:user_id]=nil end
    redirect_to cata_index_path
  end

  def search
    if params[:searchbtn]
      @we_have=[]
      @results=[]
      @subject = Subject.where("name = ?",params[:selection])
      @temp = @subject.first
      @we_have.append(@temp.subject_id)

      @courses =Course.where( "name like?","%#{params[:terms]}%")
      @courses.each do |course|
        @should_be = []
        @subjects = course.subjects
        @subjects.each do |s|
          @should_be.append(s["id"])
        end
        if @should_be.include?@we_have[0]
          @results = @results.append(course)
        end
      end

      if @results.length > 0
        @results = @results.uniq
      end

    #  if !params[:commit].nil?
      #  Enrollment.new(:username=>'liuchao',:coursename => params[:commit]).save

    #  end

    end

  end

  def enroll
    Enrollment.new(:username=>'hahahaha',:coursename => params[:coursename]).save
    redirect_to cata_index_path
  end



end
