module SessionHelper
  def sign_in_as_user
    let(:current_user) { FactoryGirl.create(:user) }
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      allow(controller).to receive(:current_user) { current_user }
    end
  end
end
