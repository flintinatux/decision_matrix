FactoryGirl.define do
  factory :decision do
    question 'Which career should I choose?'
  end

  factory :criterion do
    name     'Salary'
    weight   5
  end

  factory :choice do
    name     'Engineering'
  end

  factory :score do
    association :choice
    association :criterion
    value    5
  end
end