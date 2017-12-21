class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  protected

  def pain_level_validate_opts
  	{ 
  		less_than_or_equal_to: 10,
	  	greater_than_or_equal_to: 0,
	  	only_integer: true
  	}
  end
end
