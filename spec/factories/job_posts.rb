# To generate this factory run:
# rails g factory_bot:model job_post
# in the factory file we have access to the column names as methods which takes a block to generate fake infos for us

DESCRIPTION = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Vel, incidunt modi. Dolorum, libero fugiat. Magnam distinctio fugit id? Incidunt laudantium porro facilis quas ipsa deserunt error perspiciatis temporibus aut recusandae.'

# All of your factories must always generate valid instances of your models.
FactoryBot.define do
  factory :job_post do
    
    # Sequence is a method provided by factory_bot which keeps injecting a variable n. 
    # n is usually a number that factory-bot increments on every object it generates,
    #  so we can use it to make sure all the instances created re unique.
    sequence(:title){|n| Faker::Job.title + "#{n}"}

    description { DESCRIPTION }
    # In this case we are adding 100 character to the description of any job_post to make sure it passes a description validation.

    location { Faker::Address.city }
    min_salary{rand(80_000..200_000)}
    max_salary{rand(200_000..400_000)}

  end
end

# FactoryBot.create(:job_post)  👈🏻So this will create a object and save it in a database
# Factory.build(:job_post) 👈🏻 So this wi0ll give us an object like .new but will not save in database 
# FactoryBot.attributes_for(:job_post)
# Returns a plain hash of the parameters required to create
# a JobPost

# FactoryBot.build(:job_post)
# Returns a new un-saved instance of JobPost
# (using the factory)

# We can also overwrite the FactoryBot
# job_post_a = FactoryBot.create(
#   :job_post, title: "Software Engineer"
# )