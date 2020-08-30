describe Users::UserCreateFacade do

  subject { described_class.new(
    email: email,
    password: "bar",
    first_name: first_name,
    last_name: last_name
    ) }

  let!(:user) { create(:user, email: 'foo') }

  context "when all fields are filled" do

    context "and email is NOT associated to a current user" do
      let(:email) { "new@user.com" }
      let(:first_name) { "Batman" }
      let(:last_name) { "Robin" }

      it "creates a user" do
        user = subject.run

        expect(user[:email]).to eq( email )
      end

      it "creates a profile" do
        user = subject.run
        profile = Profile.find_by(user_id: user.id)

        expect(profile.first_name).to eq (first_name)
        expect(profile.last_name).to eq (last_name)
      end

      it "creates a feed" do
        user = subject.run
        profile = Profile.last
        feed = Feed.last

        expect(feed.user_id).to eq( user[:id] )
        expect(feed.profile_id).to eq (profile.id)
      end
    end

    context "and the email is already assigned to a user" do
      let(:email) { "foo" }
      let(:first_name) { Faker::Name.first_name }
      let(:last_name) { Faker::Name.last_name }
      it "raises an error" do
      expect { subject.run }.to raise_error(Users::UserCreateFacade::UserAlreadyExists)
      end
    end

  end
end
