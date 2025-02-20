require "test_helper"

class BorrowersControllerTest < ActionDispatch::IntegrationTest
  test "should create borrower" do
    assert_difference("Borrower.count", 1) do
      post borrowers_path, params: { borrower: { name: "Jane Doe", email: "jane@example.com", phone: "987654321" } }
    end
    assert_redirected_to borrower_path(Borrower.last)
  end

  test "should not create borrower without email" do
    post borrowers_path, params: { borrower: { name: "Jane Doe", phone: "987654321" } }
    assert_response :unprocessable_entity
  end
end