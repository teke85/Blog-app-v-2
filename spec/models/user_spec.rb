require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'Teke', bio: 'Full Stack Developer', posts_counter: 0) }

  before { subject.save }

  context 'Validating :name' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid if not unique' do
      User.create(name: 'Jay', bio: 'Full Stack Developer', posts_counter: 3)
      subject.name = 'jay'
      expect(subject).to_not be_valid
    end
  end

  context 'Associations' do
    it 'has many posts' do
      expect(described_class.reflect_on_association(:posts).macro).to eq :has_many
    end
  end
end
