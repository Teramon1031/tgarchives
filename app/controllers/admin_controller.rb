class AdminController < ApplicationController
  before_action :authenticate_user,{except:[:login, :loginPost]}
  def login
    if session[:user_id]!=nil
      redirect_to("/admin/list")
    end
  end

  def loginPost
    @user = User.find_by(name: params[:name])
    puts "-----user-----"
    puts "name: #{@user.name}"
    if @user && @user.authenticate(params[:password])
      puts "-----authenticated-----"
      flash[:notice]="ログインできました"
      session[:user_id] = @user.id
      redirect_to("/admin/list")
    else
       puts "-----failed-----"
      flash[:notice]="何かが間違っています"
      redirect_to("/admin/login")
    end
  end

  def list
    @projects = Project.all
  end

  def edit
    @project = Project.find_by(team_id: params[:id])
    if !@project
      redirect_to("/")
    else
      @pitch_video_id = @project.pitch_video.slice(-11, 11)
      @demo_video_id = @project.demo_video.slice(-11, 11)
    end
  end

  def new
    @project = Project.find_by(id: 1)
    @pitch_video_id = @project.pitch_video.slice(-11, 11)
    @demo_video_id = @project.demo_video.slice(-11, 11)
  end

  def update
     @project = Project.find_by(team_id: params[:id])
     @project.team_name=params[:team_name]
     @project.app_name=params[:app_name]
     @project.year=params[:year]
     @project.member_num=params[:member_num].to_i
     if @project.save
      flash[:notice]="Saved Successfully"
     else
      flash[:notice]=@project.errors.full_messages
     end
     redirect_to("/admin/edit/#{@project.team_id}")
  end
end
