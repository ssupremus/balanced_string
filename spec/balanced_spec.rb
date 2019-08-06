require_relative '../balanced'

describe "BalancedSpec" do
  it "empty string should be true" do
    expect(balanced?("")).to be_truthy
  end

  it "[()]{}{[()()]()} should be true" do
    expect(balanced?("[()]{}{[()()]()}")).to be true
  end

  it "[(]) should be be false" do
    expect(balanced?("[(])")).to be false
  end

  it ")(){} should be false" do
    expect(balanced?(")(){}")).to be false
  end

  it "[]({}) should be true" do
    expect(balanced?("[]({})")).to be true
  end

  it "([]) should be true" do
    expect(balanced?("([])")).to be true
  end

  it "([)] should be false" do
    expect(balanced?("([)]")).to be false
  end

  it "(){}[] should be true" do
    expect(balanced?("(){}[]")).to be true
  end

  it "(){}[]( should be false" do
    expect(balanced?("(){}[](")).to be false
  end

  it "valid string with additional symbols should be true" do
    expect(balanced?("(aaa){bbb}[Cc]")).to be true
  end
end
