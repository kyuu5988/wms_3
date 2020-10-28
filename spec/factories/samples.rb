FactoryBot.define do
  factory :sample do
    基本コード    {Faker::Base.numerify('4000######')}
    サブコード    {Faker::Base.numerify('0##')}
    個別番号      {Faker::Base.numerify('##')} 
    申込番号      {Faker::Base.numerify('######')}
    販売商品名    {Faker::Name.initials(number: 8)}
    カテゴリー    {Faker::Base.numerify('##')}
    ロケーション  {"11111111"}
  end
end
