class HomeController < ApplicationController
  def index
    @bar =Gchart.line(:data => [0, 40, 10, 70, 20])
#    @bar = GoogleChart.pie(10,20,40,30).to_url
  end
end
