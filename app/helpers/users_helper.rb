module UsersHelper
  def profile_picture(user)
    if user.profile_picture.attached?
      image_tag user.profile_picture, class: "profile-picture"
    else
      image_tag asset_path("default_pp.png"), class: "profile-picture"
    end
  end
end
