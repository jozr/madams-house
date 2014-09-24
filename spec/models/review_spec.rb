require 'rails_helper'

describe Review do
  it {should belong_to :user}
  it {should belong_to :den}

  it {should validate_presence_of :content}
  it {should validate_presence_of :user_id}
  it {should validate_presence_of :den_id}
  it {should validate_presence_of :rating}
end
