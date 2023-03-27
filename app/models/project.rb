class Project < ApplicationRecord
    validates :app_name, {presence: true}
    validates :team_name, {presence: true}
    validates :member_num, {presence: true,  numericality:{in: 1..5}}
    validates :year, {presence: true}
    validates :team_num, {presence: true }
    validates :pitch_video, {presence: true}
    validates :demo_video, {presence: true}
    # validates :business_plan, {presence: true}
    # validates :summary, {presence: true}
    # validates :description, {presence: true}
    # validates :journey, {presence: true}

     def short_summary
        text = self.description
        return text[0,100]
    end
end
