current_valuation = 0

Dashing.scheduler.every '1m' do
  last_valuation = current_valuation
  current_valuation = rand(1000)
  
  

  Dashing.send_event('valuation', { current: current_valuation, last: last_valuation })
  
 EstadoMaquina.all.each do |e| 
	Dashing.send_event("maquina"+e.id.to_s,   { value: Maquina.where("estado_maquina_id="+e.id.to_s).count })
 end
 
 Dashing.send_event("hola",   { value:40 })
end
