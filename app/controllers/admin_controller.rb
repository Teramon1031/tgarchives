class AdminController < ApplicationController
  before_action :authenticate_user,{except:[:login, :loginPost, :signupPost]}

  def login
    if session[:user_id]!=nil
      flash[:notice]="既にログインしています"
      redirect_to("/")
    end
  end


  def signupPost
     @user = User.new(name: params[:newname],password: params[:newpassword])
     if @user.save
      flash[:notice] =  "#{@user.name}としてサインアップしました"
      session[:user_id] = @user.id
      redirect_to("/")
     else 
      flash[:notice] = "サインアップできませんでした"
      redirect_to("/login")
     end
  end

  def loginPost
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      flash[:notice]="ログインできました"
      session[:user_id] = @user.id
      redirect_to("/")
    else
      flash[:notice]="何かが間違っています"
      redirect_to("/admin/login")
    end
  end

  def logoutPost
    session[:user_id] = nil
    flash[:notice]="ログアウトしました"
    redirect_to("/")
  end

  def list
    @projects = Project.all
  end

  def edit
    @project = Project.find_by(year: params[:year], team_num: params[:num])
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

  def create
    @project = Project.new
     @project.team_name = params[:team_name]
     @project.app_name = params[:app_name]
     @project.year = params[:year]
     @project.team_num = params[:team_num]
     @project.member_num = params[:member_num].to_i
     @project.pitch_video = params[:pitch_video]
     @project.demo_video = params[:demo_video]
     @project.journey = params[:journey]
     @project.description = params[:description]
     @project.prize = params[:prize]
     if params[:semifinal]=="on"
      @project.semifinal=1
     else
      @project.semifinal=0
     end
    if params[:final]=="on"
      @project.final=1
     else
      @project.final=0
     end

     if @project.save
      flash[:notice] = "作成に成功しました"
      redirect_to("/#{@project.year}/#{@project.team_num}")
     else
      flash[:notice] = @project.errors.full_messages
      redirect_to("/admin/new")
     end
  end

  def update
     @project = Project.find_by(year: params[:year], team_num: params[:num])
     @project.team_name = params[:team_name]
     @project.app_name = params[:app_name]
     @project.year = params[:year]
     @project.member_num = params[:member_num].to_i
      @project.pitch_video = params[:pitch_video]
     @project.demo_video = params[:demo_video]
     @project.journey = params[:journey]
     @project.description = params[:description]
     @project.prize = params[:prize]
     if params[:semifinal]=="on"
      @project.semifinal=1
     else
      @project.semifinal=0
     end
    if params[:final]=="on"
      @project.final=1
     else
      @project.final=0
     end
     if @project.save
      flash[:notice] = "Saved Successfully"
     else
      flash[:notice] = @project.errors.full_messages
     end
     redirect_to("/#{@project.year}/#{@project.team_num}")
  end
end
