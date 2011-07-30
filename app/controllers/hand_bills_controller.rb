#coding: utf-8
class HandBillsController < CarryingBillsController
  skip_authorize_resource :only => [:update,:edit]
end
