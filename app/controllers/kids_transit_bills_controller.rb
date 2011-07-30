class KidsTransitBillsController < CarryingBillsController
  skip_authorize_resource :only => [:update,:edit]
end
