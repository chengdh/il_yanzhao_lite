#coding: utf-8
#为Array类添加导出csv方法
require 'csv'
require "nkf"
class Array
  #BOM_HEADER = ["FFFE"].pack("H*")
  #FIXME 此处编码问题未解决
  BOM_HEADER = ""
  def to_csv(options = {})
    return '' if self.empty?

    klass      = self.first.class
    attributes = self.first.attributes.keys.sort.map(&:to_sym)

    if options[:only]
      columns = Array(options[:only]) & attributes
    else
      columns = attributes - Array(options[:except])
    end

    columns += Array(options[:methods])

    return '' if columns.empty?

    output = CSV.generate(:col_sep => "\t", :row_sep => "\r\n") do |csv|
      csv << columns.map { |column| klass.human_attribute_name(column) } unless options[:headers] == false
      self.each do |item|
        csv << columns.collect { |column| item.send(column) }
      end
    end
    output
  end
  def export_csv(options ={},with_bom_header = true)
    #参考http://blog.enjoyrails.com/2008/12/12/rails-导入导出csv数据时的中文编码问题/
    #BOM头信息
    ret = ""
    if with_bom_header
      ret = NKF.nkf("-w16L",self.to_csv(options))
    else
      ret = NKF.nkf("-w16L0",self.to_csv(options))
    end
    ret
  end
  #将数组中的数据导出为一行
  def export_line_csv(with_bom_header = false)
    output = CSV.generate(:col_sep => "\t", :row_sep => "\r\n")do |csv|
      csv << self
    end
    if with_bom_header
      ret = NKF.nkf("-w16L",output)
    else
      ret = NKF.nkf("-w16L0",output)
    end
  end
end
