class EgresosPeriodicos
  @queue = :pagos_periodicos #this class variable will be used as queue name in resque, so you can fill in different name
  def self.perform() # I didn't need any parameter, so I leave it blank
    `date >> /tmp/rage.txt`
  end
end