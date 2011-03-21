require 'populator'
require 'faker'

Faker::Config.locale = :en

namespace :db do

  desc %{Populates application with sample data}
  task :populate => %w{cities accounts companies}.map{ |name| "populate:#{name}" }

  namespace :populate do
    desc "Populate database with cities"
    task :cities => :environment do

      10.times do
        city = City.new(:name => Faker::Address.city)
        city.save!
        puts %{City "#{city.name}" was created}
      end

    end

    desc "Populate database with user accounts"
    task :accounts => :environment do
      10.times do
        user = User.create do |user|
          user.email = Faker::Internet.email
          user.first_name  = Faker::Name.first_name
          user.last_name = Faker::Name.last_name
          user.password_confirmation = user.password = 'testtest'
        end
        puts %{User "#{user.name}" was created}
      end

    end

    desc "Populate database with company accounts"
    task :companies => :environment do
      @cities = City.all
      10.times do
        company = Company.create do |company|
          company.email = Faker::Internet.email
          company.name  = Faker::Company.name
          company.twitter = Faker::Internet.user_name
          company.facebook = 'http://' + Faker::Internet.domain_name
          company.vkonatkte = 'http://' + Faker::Internet.domain_name
          company.password_confirmation = company.password = 'testtest'
          company.city_id = City.all[rand(9)].id
        end
        puts %{Company "#{company.name}" was created}
      end
    end
  end
end
