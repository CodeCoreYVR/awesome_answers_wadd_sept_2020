require 'rails_helper'

RSpec.describe JobPost, type: :model do
  # List of expectations and matchers:
  # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers

  # The "describe" method groups related tests together. It works same
  # as "context". It provides a level of organization for the tests.
  describe("validates") do
    it("requires a title") do 
      # GIVEN 
      # An instance of a JobPost (without a title)
      job_post = JobPost.new

      # WHEN
      # Validations are triggered when we check for validity or
      # when we attempt to save it to the database
      job_post.valid?

      # THEN
      
      # There's an error related to title in the errors object of
      # the JobPost. The following will pass the test if the 
      # errors.messages hash has a key named :title
      # This only occurs if a title validation failed.

      # Use the "expect" method instead of "assert" to write 
      # expectations. It take a single argument which is the value
      # that we're going to test. We call "to" on the object that 
      # returns with a matcher to performs the verification of the value.
      expect(job_post.errors.messages).to(have_key(:title))
    end

    it("requires a unique title") do
      # GIVEN: A job post in the database and an instance of another
      # job post with the same title:
      persisted_job_post = JobPost.create(title: "Full Stack Developer")
      job_post = JobPost.new(title: persisted_job_post.title)

      # WHEN
      job_post.valid?

      # THEN
      expect(job_post.errors.messages).to(have_key(:title))
      expect(job_post.errors.messages[:title]).to(include("has already been taken"))
    end
  end
end
