# typed: false
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  protected

  def update_code(scope)
    code = Code.find code.id
    code.scope = scope
    code.save
  end
end
