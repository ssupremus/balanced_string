require_relative '../balanced'

describe "Class method .balanced?" do
  context 'when we have round brackets as incoming params' do
    context 'when brackets unbalanced' do
      it 'returns false' do
        expect(balanced?(")()(")).to be false
      end
    end

    context 'when brackets balanced' do
      it 'returns true' do
        expect(balanced?("(()())")).to be true
      end
    end
  end
  context 'when we have square brackets as incoming params' do
    context 'when brackets unbalanced' do
      it 'returns false' do
        expect(balanced?("[[]")).to be false
      end
    end

    context 'when brackets balanced' do
      it 'returns true' do
        expect(balanced?("[[[]][]]")).to be true
      end
    end
  end

  context 'when we have figure brackets as incoming params' do
    context 'when brackets unbalanced' do
      it 'returns false' do
        expect(balanced?("{}{")).to be false
      end
    end

    context 'when brackets balanced' do
      it 'returns true' do
        expect(balanced?("{}{}{}{}")).to be true
      end
    end
  end

  context 'when we have different brackets as incoming params' do
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
end
