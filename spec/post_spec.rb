require "post"

RSpec.describe Post do
  it "returns true when post is read" do
    expect(subject.mark_as_read!).to be true
  end

  it "returns true for a read post" do
    subject.mark_as_read!
    expect(subject.post_read?).to be true
  end
end
