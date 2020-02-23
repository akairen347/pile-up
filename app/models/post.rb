class Post < ApplicationRecord
    validates :content, {presence: true ,length:{maximum:140}}
    validates :user_id,{presence:true}
    validates :time, {presence: true ,length:{maximum:4}}
    validates :type, {presence: true ,length:{maximum:30}}



    self.inheritance_column = :_type_disabled



    belongs_to :user


    def user
        return User.find_by(id: self.user_id)
      end



      def find_or_create_from_auth(auth,id)
        user = User.find(id)
        provider = auth[:provider]
        uid = auth[:uid]
        nickname = auth[:info][:nickname]
        name = auth[:info][:name]
        image_url = auth[:info][:image]
        description = auth[:info][:description]
        user.update_attributes(id: id, provider: provider, uid: uid, nickname: nickname, name: name, description: description)
      end

end
