FactoryGirl.define do
  factory :decision do
    question { Faker::Company.bs }
  end
end