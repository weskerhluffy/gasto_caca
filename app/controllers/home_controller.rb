class HomeController < ApplicationController
  def index
    @totales=[]
    @totales=QuerysComplejos.totales
#    @bar =Gchart.bar(:data => @totales[0],:legend=> @totales[1], 
    @bar =Gchart.bar(:data => [[@totales[0][0]], [@totales[0][1]],[1*@totales[0][2]]], :legend=> @totales[1], 
#    @bar =Gchart.bar(:data => [[4], [1],[5]], :legend=> @totales[1], 
    :bar_colors => "FF0000,00FF00,000000",:stacked => false,
#    :bar_colors => [["FF0000"],["00FF00"],["000000"]],:stacked => false,:size => '800x100',
    :axis_with_labels => ['y'])
  end
end
