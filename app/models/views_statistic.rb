class ViewsStatistic < ActiveRecord::Base
  belongs_to :article
  belongs_to :blog
end
