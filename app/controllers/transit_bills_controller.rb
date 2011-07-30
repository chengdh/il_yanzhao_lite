#coding: utf-8
class TransitBillsController < CarryingBillsController
  skip_authorize_resource :only => [:update,:edit]
end
