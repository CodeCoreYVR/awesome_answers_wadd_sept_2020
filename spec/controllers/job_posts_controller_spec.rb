require 'rails_helper'

RSpec.describe JobPostsController, type: :controller do
  describe("#new") do
    it("renders a new template") do
      # GIVEN
      # defaults

      # WHEN
      # Make GET request to the new action
      # When testing controllers, use methods named after HTTP verbs (e.g. get, post,
      # patch, put, delete) to simulate HTTP requests to your controller actions.
      get(:new)

      # THEN
      # The "response" object is available inside any controller test and it also has
      # the rendered template. We also have "flash" and "session" objects available to test.

      # We expect the response to render "new.html.erb". For this we'll use a method
      # called "render_template" which comes with a gem: "rails-controller-testing"
      expect(response).to(render_template(:new))
    end

    it("sets an instance variable of a new job post") do
      get(:new)

      # assigns(:job_post) returns the value of the instance variable named
      # after the symbol argument (e.g. :job_post -> @job_post)
      # Only available with the gem "rails-controller-testing"

      # This will verify that the expected value is a new instance
      # of the JobPost model
      expect(assigns(:job_post)).to(be_a_new(JobPost))
    end
  end

  describe("#create") do
    context("with valid parameters") do
      it("creates a new job post") do
        # GIVEN
        count_before = JobPost.count 

        # WHEN
        # Returns a plain hash of the parameters required to create a JobPost
        # This hash simulates the body of a form, which is nested under params[:job_post]
        post(:create, params: { job_post: FactoryBot.attributes_for(:job_post) })

        # THEN
        count_after = JobPost.count

        expect(count_after).to(eq(count_before + 1))
      end

      it("redirects to the show page of that job post") do
        post(:create, params: { job_post: FactoryBot.attributes_for(:job_post) })
        
        job_post = JobPost.last
        
        expect(response).to(redirect_to(job_post_path(job_post)))
      end
    end

    context("with invalid parameters") do
      def invalid_request
        post(:create, params: { job_post: FactoryBot.attributes_for(:job_post, title: nil )})
      end

      it("doesn't create a new job post") do
        count_before = JobPost.count

        invalid_request

        count_after = JobPost.count
        expect(count_after).to(eq(count_before))
      end

      it("renders the new template") do
        invalid_request
        expect(response).to(render_template(:new))
      end

      it("assigns an invalid job post as an instance variable") do
        invalid_request

        # "be_a" checks that the expected value is an instance of the 
        # given class
        expect(assigns(:job_post)).to(be_a(JobPost))
        expect(!assigns(:job_post).valid?)
      end
    end

    describe("#show") do
      it("renders the show template") do
        # GIVEN
        # A job post in the database
        job_post = FactoryBot.create(:job_post)

        # WHEN
        # A GET to /posts/:id
        get(:show, params: { id: job_post.id })

        # THEN
        # The response contains the rendered show template
        expect(response).to(render_template(:show))
      end

      it("assigns an instance variable for the shown job post") do
        job_post = FactoryBot.create(:job_post)

        get(:show, params: { id: job_post.id })

        expect(assigns(:job_post)).to(eq(job_post))
      end
    end
  end
end
