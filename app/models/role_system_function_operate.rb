#coding: utf-8
class RoleSystemFunctionOperate < ActiveRecord::Base
  belongs_to :role
  belongs_to :system_function_operate,:include => :system_function
end
