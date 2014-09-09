require 'test_helper'

class QcmTest < ActiveSupport::TestCase

  test "have a valid factory" do
    assert FactoryGirl.build(:qcm).valid?
  end

  test "invalid without lesson" do
    assert FactoryGirl.build(:qcm, lesson: nil).invalid?
  end
end
