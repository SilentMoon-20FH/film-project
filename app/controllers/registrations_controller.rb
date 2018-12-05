
#这个文件是之前尝试自定义user_controller的，现在无效

class DeviseCustomed::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end
 
  def create
    # add custom create logic here
    super do |resource|
      resource.group = params[:user][:group]
    end
  end
 
  def update
    super
  end
  
  # 链接：https://www.jianshu.com/p/70c6551ee6bd
  # 上传头像
  def upload_avatar
    avatar = params[:avatar]
    user = User.find(params[:id])
    # !!! 这句在数据中存储的是文件名：例如：20171026_204107_crop.jpg
    user.avatar = avatar
    if user.save
      render json: {code: 1, usericon: generate_user_avatar_url(user.id), message: "头像上传成功"}
      return
    end
    render json: {code: 2, message: "头像上传失败"}
  end
  
  # 链接：https://www.jianshu.com/p/70c6551ee6bd
  def generate_user_avatar_url(user_id)
    return "http://#{request.host_with_port}/user/avatar/#{user_id}"
  end
  
  # 链接：https://www.jianshu.com/p/70c6551ee6bd
  # 返回用户头像
  def avatar
    id = params[:id]
    user = User.where(id: id).last
    if user==nil
      #默认图
      path = "#{Rails.root}/public/uploads/user/avatar/default_user_icon.png"
    else
      # user.avatar = /uploads/user/avatar/46/da_1509356355185_crop.jpeg
      path = "#{Rails.root}/public#{user.avatar}"
    end
    data = File.read(path)
    send_data(data, type: "image", disposition: "inline")
  end
  
end