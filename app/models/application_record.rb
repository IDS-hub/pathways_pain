class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  protected

  def self.pain_level_validate_opts
  	{ 
  		less_than_or_equal_to: 10,
	  	greater_than_or_equal_to: 0,
	  	only_integer: true
  	}
  end

  def self.position_validate_opts
  	{
  		uniqueness: true,
			presence: true,
			numericality: {
				greater_than: 0
			}
		}
  end
end
