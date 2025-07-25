module SystemTestHelpers
  def sign_in_as(user)
    visit new_session_path
    fill_in "email_address", with: user.email_address
    fill_in "password", with: TestConstants::USER_PASSWORD
    click_button "Sign in"
  end
end
