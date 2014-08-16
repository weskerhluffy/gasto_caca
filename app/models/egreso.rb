class Egreso < ActiveRecord::Base
  include Filterable
  
  belongs_to :tipo_egreso
  belongs_to :tipo_ingreso
  belongs_to :aplicacion_periodica
  attr_accessible :aplicacion, :descripcion, :monto, :tipo_egreso_id, :deuda_ids, :aplicacion_periodica_ids, :tipo_ingreso_id, :referencia_bancaria
  has_and_belongs_to_many :deudas
  has_many :ingresos
  has_many :aplicacion_periodicas
  
#  scope :red, -> { where(color: 'red') }
#  scope :status, ->(user) { where(status: 'status') }
# XXX: http://archives.ryandaigle.com/articles/2007/1/26/what-s-new-in-edge-rails-1-month-from_now-no_longer-effed
# XXX: http://stackoverflow.com/questions/12784991/querying-for-date-range-in-rails
# XXX: http://stackoverflow.com/questions/2381718/rails-activerecord-date-between
# XXX: http://po-ru.com/diary/ruby-on-rails-monthago-considered-harmful/
# XXX: http://blog.plataformatec.com.br/2013/02/active-record-scopes-vs-class-methods/
# XXX: http://www.informit.com/articles/article.aspx?p=2220311
  scope :recientes, ->(incluir_por_aplicar=true) { 
    if incluir_por_aplicar
       # XXX: http://stackoverflow.com/questions/8620547/rails-scope-for-is-not-null-and-is-not-empty-blank
       # XXX: http://stackoverflow.com/questions/3684311/rails-how-to-chain-scope-queries-with-or-instead-of-and
       where(:aplicacion => 1.month.ago.change(day:13)..Date.tomorrow) | where(:aplicacion=>nil)
    else
       where(:aplicacion => 1.month.ago.change(day:13)..Date.tomorrow)
    end
  }
#  scope :recientes, -> { where(:aplicacion => 1.month.ago.beginning_of_month..Date.today.end_of_month) }
#  scope :recientes, -> { where(:aplication =>'red') }
#  scope :today, where(:transfer_date => Date.today...Date.tomorrow)
#  scope :today1, -> {where(:transfer_date => Date.today...Date.tomorrow)}
#  scope :recientes, -> {where(:aplicacion => Date.today...Date.tomorrow)} 
  
end
