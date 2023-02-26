module Mutations
  class CreateUserMutation < BaseMutation
    # often we will need input types for specific mutation
    # in those cases we can define those input types in the mutation class itself
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    argument :name, String, required: true
    argument :auth_provider, AuthProviderSignupData, required: false

    type Types::UserType
    field :user, ::Types::UserType, null: false
    field :status, Int, null: false

    def resolve(name: nil, phone_number: nil, auth_provider: nil, file: nil, gender: nil)
      user = Contexts::Users::Repository.new.create_user(auth_provider: auth_provider, name: name)
      User.where(email: auth_provider[:credentials][:email]).first
    end
  end
end
