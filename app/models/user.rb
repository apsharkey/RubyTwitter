# == Schema Information
#
# Table name: users
#
#  id                   :integer(4)      not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  password_salt        :string(255)     default(""), not null
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer(4)      default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  username             :string(255)
#  first_name           :string(255)
#  last_name            :string(255)
#  about                :string(255)
#  website              :string(255)
#  photo_file_name      :string(255)
#  photo_content_type   :string(255)
#  photo_file_size      :integer(4)
#  photo_updated_at     :datetime
#  relationship_status  :string(255)
#  admin                :boolean(1)      default(FALSE)
#

class User < ActiveRecord::Base
  
  has_friendly_id :username

  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_attached_file :photo, :styles => { :thumb => "48x48#", :small => "128x128#"}, :processors => [:cropper],
    :content_type => 'image/jpeg/png',
    :storage => :s3,
    :bucket         => ENV['S3_BUCKET'],
    :s3_credentials => { :access_key_id     => ENV['S3_KEY'], 
                         :secret_access_key => ENV['S3_SECRET'] },
    :path => "/:style/:id/:normalized_photo_file_name"

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username, :first_name, :last_name, :about, :website, :photo,
                  :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at,
                  :relationship_status
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  has_many :authentications
  has_many :posts,                  :dependent => :destroy
  has_many :reposts,                :dependent => :destroy
  has_many :notifications,          :dependent => :destroy
  has_many :relationships,          :dependent => :destroy,
                                    :foreign_key => "follower_id"
  has_many :reverse_relationships,  :dependent => :destroy,
                                    :foreign_key => "followed_id",
                                    :class_name => "Relationship"
  has_many :following, :through =>  :relationships, :source => :followed
  has_many :followers, :through =>  :reverse_relationships,
                        :source =>  :follower

  validates :about,     :length => { :maximum => 140 }
  validates :website, :length => { :maximum => 100 }
  validates :first_name, :presence => true, :length => { :maximum => 20 }
  validates :last_name, :presence => true, :length => {:maximum => 25 }
  
  after_update :reprocess_avatar, :if => :cropping?
  
  searchable do
    text :username
    text :first_name
    text :last_name
  end

  
  def feed
    @posts =  Post.from_users_followed_by(self)
    @reposts = Repost.from_users_followed_by(self)
    @results = @posts | @reposts
    @results.sort!{|a,b|a.updated_at <=> b.updated_at}
    @results.reverse
  end
  
  def profile_feed
    @posts = self.posts
    @reposts = Repost.where(:reposter_id => self.id)
    @results = @posts | @reposts
    @results.sort!{|a,b|a.updated_at <=> b.updated_at}
    @results.reverse
  end
  
  def following?(followed)
    relationships.find_by_followed_id(followed)
  end
  
  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end
  
  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end
  
  def cropping?
      !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
    end

    def avatar_geometry(style = :original)
      @geometry ||= {}
      @geometry[style] ||= Paperclip::Geometry.from_file(avatar.path(style))
    end

    Paperclip.interpolates :normalized_photo_file_name do |attachment, style|
        attachment.instance.normalized_photo_file_name
      end

      def normalized_photo_file_name
        "#{self.id}-#{self.photo_file_name.gsub( /[^a-zA-Z0-9_\.]/, '_')}" 
      end

       def reprocess_avatar
          avatar.reprocess!
        end
    
      # this function allows "Edit" user without a password in Devise
        def update_with_password(params={}) 
          if params[:password].blank? 
            params.delete(:password) 
            params.delete(:password_confirmation) if params[:password_confirmation].blank? 
          end 
          update_attributes(params) 
        end

end




