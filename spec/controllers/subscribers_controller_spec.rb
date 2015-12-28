require "rails_helper"

RSpec.describe SubscribersController, :type => :controller do

  describe "POST #create" do
    context "when valid request" do
      before(:each) { include_headers(:json) }

      context "then creating a new subscriber" do
        let(:email) { "example@gmail.com" }

        before(:each) do
          post :create, subscriber: { email: email }
        end

        it "responds with status (201 Created)" do
          expect(response).to have_http_status(201)
        end

        it "responds with proper JSON" do
          expect(json).to include({ 
            "subscriber" => {
              "id"    => Integer,
              "email" => email 
            }
          })
        end

        it "creates one subscriber" do
          expect(Subscriber.all.count).to eq(1)
        end
      end
      context "then re-enabling subscriber which has been previously unsubscribed" do
        let!(:old_subscriber) { FactoryGirl.create(:subscriber) }

        before(:each) do
          post :create, subscriber: { email: old_subscriber.email }
        end

        it "responds with status (201 Created)" do
          expect(response).to have_http_status(201)
        end

        it "responds with proper JSON" do
          expect(json).to include({ 
            "subscriber" => {
              "id"    => Integer,
              "email" => old_subscriber.email 
            }
          })
        end

        it "doesnt create new, has still one subscriber" do
          expect(Subscriber.all.count).to eq(1)
        end
      end
      context "then subscribing with email address which is already active" do
        let!(:old_subscriber) { FactoryGirl.create(:subscriber, active: true) }

        before(:each) do
          post :create, subscriber: { email: old_subscriber.email }
        end

        it "responds with status (200 OK)" do
          expect(response).to have_http_status(200)
        end

        it "responds with proper JSON" do
          expect(json).to include({ 
            "subscriber" => {
              "id"    => Integer,
              "email" => old_subscriber.email 
            }
          })
        end

        it "doesnt create new, has still one subscriber" do
          expect(Subscriber.all.count).to eq(1)
        end
      end
    end

    context "when invalid request" do
      context "then requested with invalid MIME type" do
        before(:each) do 
          include_headers(:html) 
          post :create, subscriber: { email: "valid@email.com" }
        end

        it "responds with status (406 Not Acceptable)" do
          expect(response).to have_http_status(406)
        end
      end
      context "then email is invalid" do
        let(:email) { "not-valid-email.com" }

        before(:each) do
          include_headers(:json)
          post :create, subscriber: { email: email }
        end

        it "responds with status (422 Unprocessable Entity)" do
          expect(response).to have_http_status(422)
        end

        it "responds with proper JSON" do
          expect(json).to include({ 
            "email" => Array # Has the errors..
          })
        end

        it "doesnt create the subscriber" do
          expect(Subscriber.all.count).to eq(0)
        end
      end
    end
  end

  describe "GET #activate" do
    context "when valid request" do
      before(:each) { include_headers(:html) }

      context "then activates subscription to the site" do
        let!(:subscriber) { FactoryGirl.create(:subscriber) }

        before(:each) do
          get :activate, { id: subscriber.id, token: subscriber.token, email: subscriber.email }
        end

        it "responds with status (200 OK)" do
          expect(response).to have_http_status(200)
        end

        it "renders the activate template" do
          expect(response).to render_template(:activate)
        end

        it "has subscriber.active = true" do
          expect(subscriber.reload.active).to be_truthy
        end
      end
    end

    context "when invalid request" do
      context "then requested with invalid MIME type" do
        let!(:subscriber) { FactoryGirl.create(:subscriber) }
        before(:each) do 
          include_headers(:json) 
          get :activate, { id: subscriber.id, token: subscriber.token, email: subscriber.email }
        end

        it "responds with status (406 Not Acceptable)" do
          expect(response).to have_http_status(406)
        end
      end
      context "then given token is already expired" do
        let!(:subscriber) { FactoryGirl.create(:subscriber, token_expires_at: Time.now.utc - 48.hours) }
        before(:each) do
          include_headers(:html)
          get :activate, { id: subscriber.id, token: subscriber.token, email: subscriber.email }
        end

        it "responds with status (200 OK)" do
          expect(response).to have_http_status(200)
        end

        it "renders the token_expired template" do
          expect(response).to render_template(:token_expired)
        end

        it "has subscriber.active = false" do
          expect(subscriber.reload.active).to be_falsey
        end
      end
    end
  end

  describe "GET #cancel" do
    context "when valid request" do
      let!(:subscriber) { FactoryGirl.create(:subscriber, active: true) }

      before(:each) do
        include_headers(:html)
        get :cancel, { id: subscriber.id, token: subscriber.token, email: subscriber.email }
      end

      it "responds with status (200 OK)" do
        expect(response).to have_http_status(200)
      end

      it "renders the cancel template" do
        expect(response).to render_template(:cancel)
      end

      it "has subscriber.active = false" do
        expect(subscriber.reload.active).to be_falsey
      end
    end

    context "when invalid request" do
      context "then requested with invalid MIME type" do
        let!(:subscriber) { FactoryGirl.create(:subscriber) }
        before(:each) do 
          include_headers(:json) 
          get :cancel, { id: subscriber.id, token: subscriber.token, email: subscriber.email }
        end

        it "responds with status (406 Not Acceptable)" do
          expect(response).to have_http_status(406)
        end
      end
    end
  end
end












