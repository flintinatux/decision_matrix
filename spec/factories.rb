FactoryGirl.define do
  factory :decision do
    question 'Which career should I choose?'
  end

  factory :criterion do
    name     'Salary'
  end

  factory :choice do
    name     'Engineering'
  end
end