class EscalationController < ApplicationController
  def index
    c=[]
    if params[:project_id] && params[:project_id].to_i>0
      c<<"p.id=#{ params[:project_id].to_i}"
    end    
    @escalations=AbstractQuantity.select("p.name as project_name,m.name as material_name,aq.quantity as abs_quantity,aq.amount as abs_amount,
    (aq.quantity*aq.amount) as est_expense,sum(me.quantity) as purchase_quantity,avg(me.amount) as purchase_rate,
    sum(me.total_amount) as site_expense,(sum(me.total_amount)-(aq.quantity*aq.amount)) as escalation_amount")
    .joins("aq 
    inner join material_expenses me on me.material_id=aq.material_id
    and me.material_id=aq.material_id
    inner join materials m on m.id=aq.material_id
    inner join projects p on p.id=aq.project_id").where("p.is_active=1 and m.is_active=1")
    .group("p.name,m.name,aq.quantity,aq.amount")
    unless c.empty?
      c=c.join(' and ') 
      @escalations = @escalations.where(c).order("p.id")
    end    
    @total=0
  end
end
