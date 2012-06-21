class AlohomoraModel < ActiveRecord::Base
  self.abstract_class = true
  self.table_name_prefix = 'alohomora_'
end
