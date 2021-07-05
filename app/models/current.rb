class Current < ActiveSupport::CurrentAttributes
  attribute :user, :owner
end
