module ApplicationHelper
    def avatar_url(user)
        if user.image
          user.image.url
        else
          gravatar_id = Digest::MD5::hexdigest(user.email).downcase
          "https://www.gravatar.com/avatar/#{gravatar_id}.jpeg?d=identical$s150"
        end
    end
end
