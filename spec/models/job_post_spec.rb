# require 'rails_helper'

# # Every test rebuilds the database, so our persisted instances will not be persisted
# # in the next round of tests. To run tests:
# # rspec -f d

# RSpec.describe JobPost, type: :model do
#   # List of expectations and matchers:
#   # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers

#   # The "describe" method groups related tests together. It works same
#   # as "context". It provides a level of organization for the tests.
#   # "describe" usually wraps a set of tests against one functionality while
#   # "context" is to wrap a set of tests against one functionality given the same state
#   describe("validates") do
#     context("title") do
#       it("requires a title") do 
#         # GIVEN 
#         # An instance of a JobPost (without a title)
#         job_post = JobPost.new
  
#         # WHEN
#         # Validations are triggered when we check for validity or
#         # when we attempt to save it to the database
#         job_post.valid?
  
#         # THEN
        
#         # There's an error related to title in the errors object of
#         # the JobPost. The following will pass the test if the 
#         # errors.messages hash has a key named :title
#         # This only occurs if a title validation failed.
  
#         # Use the "expect" method instead of "assert" to write 
#         # expectations. It take a single argument which is the value
#         # that we're going to test. We call "to" on the object that 
#         # returns with a matcher to performs the verification of the value.
#         expect(job_post.errors.messages).to(have_key(:title))
#       end
  
#       it("requires a unique title") do
#         # GIVEN: A job post in the database and an instance of another
#         # job post with the same title:
#         persisted_job_post = JobPost.create(title: "Full Stack Developer")
#         job_post = JobPost.new(title: persisted_job_post.title)
  
#         # WHEN
#         job_post.valid?
  
#         # THEN
#         expect(job_post.errors.messages).to(have_key(:title))
#         expect(job_post.errors.messages[:title]).to(include("has already been taken"))
#       end
#     end

#     context("description") do 
#       it "requires a description" do
#         job_post = JobPost.new
        
#         job_post.valid?
  
#         expect(job_post.errors.messages).to(have_key(:description))
#       end

#       it 'must be larger than 100 characters'do
#         job_post = JobPost.new(description: "abcd")
    
#         job_post.valid?
    
#         expect(job_post.errors.messages).to(have_key(:description))
#       end
#     end

#     context("min_salary") do
#       it "salary_min must be a number greater than 30_000" do
#         job_post = JobPost.new(min_salary: 25_000)
  
#         job_post.valid?
  
#         # the error object on models have a method .details() that returns a hash, with keys
#         # that are the columns that have errors. The value is an array of 
#         # error messages, each with a error key whose value is a validation symbol

#         # Use byebug here to view the array:
#         # byebug
#         # job_post.errors.details => [{:error=>:greater_than_or_equal_to, :value=>25000, :count=>30000}]
#         expect(job_post.errors.details[:min_salary][0][:error]).to(be(:greater_than_or_equal_to))
#       end
#     end
#     context "location" do
#       it 'is required' do
#         job_post= JobPost.new
#         job_post.valid?
  
#         expect(job_post.errors.messages).to(have_key(:location))
#       end
#     end
#   end

#   # As per ruby docs, methods that are described with
#   # a '.' are class methods. Those that are described
#   # with a '#' in front are instance methods
#   describe ".search" do
#     it("returns only job posts containing the search term, regardless of case") do
#       # GIVEN
#       # 3 job posts in database
#       job_post_a = JobPost.create(
#         title: "Software Engineer"
#       )
#       job_post_b = JobPost.create(
#         title: "Programmer"
#       )
#       job_post_c = JobPost.create(
#         title: "software architect"
#       )
#       # WHEN
#       # We search for 'software'
#       results = JobPost.search('software')

#       # THEN
#       # JobPost A & C are returned
#       expect(results).to(eq([job_post_a, job_post_c]))
#     end
#   end

# end
