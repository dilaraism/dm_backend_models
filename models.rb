class Author
    include DataMapper::Resource

    property :id,                     Serial
    property :email,          String, :unique => true
    property :password,       String
    property :first_name,     String
    property :last_name,          String
    property :bio,                    Text
    property :phone,          String, :unique => true
    property :twitter,        String, :unique => true
    property :facebook,       String, :unique => true
    property :show_phone,     Boolean, :default => false
    property :show_facebook,  Boolean, :default => false
    property :show_twitter,   Boolean, :default => false  
    property :is_admin,       Boolean, :default => false
    property :this_login,      DateTime
    property :last_login,      DateTime
    property :session_lasting, Integer, :default => 0

    has n, :posts
    has n, :subscribedtags
    has n, :tags, :through => :subscribedtags 
end

class Post
      include DataMapper::Resource

      property :id,           Serial
      property :title,        String, :required => true
      property :body,           Text,   :required => true
      property :is_blog_post, Boolean, :default => true
      property :viewed,             Integer, :default => 0
      property :featured,     Boolean, :default => false
      property :created_at,     DateTime
      property :updated_at,     DateTime

      belongs_to :author
      belongs_to :category
      has n, :comments
      has n, :taggings
      has n, :tags, :through => :taggings

      validates_length_of :title, :min => 3
      validates_length_of :body, :min => 20
      validates_format_of :title, :with => /\w/

      #some other methods 

end


class Tag
    include DataMapper::Resource

    property :id,               Serial
    property :name,             String, :unique => true

    has n, :taggings
    has n, :posts, :through => :taggings
    has n, :subscribedtags
    has n, :authors, :through => :subscribedtags

    validates_length_of :name, :min => 1
    validates_format_of :name, :with => /\w/

 # some other methods

end

class Tagging
    include DataMapper::Resource

    belongs_to :tag, :key => true
    belongs_to :post, :key => true
end

class Subscribedtag
  include DataMapper::Resource

  belongs_to :tag, :key => true
  belongs_to :author, :key => true
end