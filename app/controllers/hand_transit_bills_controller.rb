#coding: utf-8
class HandTransitBillsController < CarryingBillsController
  skip_authorize_resource :only => :update
end
