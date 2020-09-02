module TestRailApiClient
    # Methods for the Users API
    #
    # @see https://www.gurock.com/testrail/docs/api/reference/users
    module Users
        def user(user_id)
            get("get_user/#{user_id}")
        end

        def users
            get('get_users')
        end

        def user_by_email(email)
            get("get_user_by_email&email=#{email}")
        end
    end
end