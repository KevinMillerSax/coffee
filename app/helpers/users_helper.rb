module UsersHelper

  def avatar_exist(user)
    if !user.avatar.attached?
      user.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/coffee.jpg"), filename: 'coffee.jpg')
    end
  end
end
