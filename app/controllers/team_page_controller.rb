class TeamPageController < ApplicationController
  def each
    @project = Project.find_by(year: params[:year], team_num: params[:num])
    if !@project
      redirect_to("/admin")
    else
      @pitch_video_id = @project.pitch_video.slice(-11, 11)
      @demo_video_id = @project.demo_video.slice(-11, 11)
    end
  end
end
