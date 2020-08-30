module Users
  class UserCreateFacade
    class UserAlreadyExists < StandardError; end
    
    def initialize(email:, password:, first_name:, last_name:)
      @email = email
      @password = password
      @first_name = first_name
      @last_name = last_name
    end

    def run
      existing_user = User.find_by(email: @email)

      raise UserAlreadyExists unless existing_user.nil?

      user = User.create(
        email: @email,
        password: @password
      )

      profile = Profile.create(
        user_id: user.id,
        first_name: @first_name,
        last_name: @last_name
      )

      Feed.create(
        profile_id: profile.id,
        user_id: user.id
      )
      user
    end
  end
end
