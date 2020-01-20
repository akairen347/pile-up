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

end
