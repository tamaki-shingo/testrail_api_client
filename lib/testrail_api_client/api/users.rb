module TestRail
  class Client
    # Methods for the Users API
    #
    # @see http://docs.gurock.com/testrail-api2/reference-users
    module Users
      #
      # Returns an existing user.
      #
      # :user_id  The ID of the user
      #
      def user(user_id)
        get("get_user/#{user_id}")
      end

      #
      # Returns a list of users.
      #
      def users
        get('get_users')
      end

      #
      # Returns an existing user by his/her email address.
      #
      # :email  The email address to get the user for
      #
      def user_by_email(email)
        get("get_user_by_email&email=#{email}")
      end
    end
  end
end
