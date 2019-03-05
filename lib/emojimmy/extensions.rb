class ActiveRecord::Base
  def self.stores_emoji_characters(*attributes)
    Emojimmy::Mixin.inject_methods(self, attributes)
  end
end
