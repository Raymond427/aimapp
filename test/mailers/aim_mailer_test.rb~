require 'test_helper'

class AimMailerTest < ActionMailer::TestCase
  test "join_now" do
    mail = AimMailer.join_now
    assert_equal "Join now", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "contact_us" do
    mail = AimMailer.contact_us
    assert_equal "Contact us", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
