require 'test_helper'

class HackTest < ActiveSupport::TestCase
  fixtures :hacks
  test "hack descriptions must not be empty" do
    hack = Hack.new
    assert hack.invalid?
    assert hack.errors[:title].any?
    assert hack.errors[:hackers].any?
  end
  
  test "hacks must have unique names" do
    hack = Hack.new(title: hacks(:iphone).title,
                    hackers: "mary",
                    gen: true)
    assert !hack.save
    assert_equal "has already been taken", hack.errors[:title].join('; ')
  end
  
end
