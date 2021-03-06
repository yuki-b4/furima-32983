FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password + 'b4' }
    password_confirmation { password + 'b4' }
    last_name = Faker::Japanese::Name.last_name
    first_name = Faker::Japanese::Name.first_name
    last_name { last_name }
    first_name { first_name }
    last_name_kana { last_name.yomi }
    first_name_kana { first_name.yomi }
    birthday { '1996-03-23' }
  end
end
