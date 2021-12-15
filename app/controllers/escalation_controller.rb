class EscalationController < ApplicationController
  def index
    c=[]
    if params[:project_id] && params[:project_id].to_i>0
      c<<"p.id=#{ params[:project_id].to_i}"
    end
    if params[:material_type_id] && params[:material_type_id].to_i>0
      c<<"m.material_type_id=#{ params[:material_type_id].to_i}"
    end        
    @escalations=AbstractQuantity.select("p.name as project_name,mt.name as material_type,m.name as material_name,m.unit,aq.quantity as abs_quantity,aq.amount as abs_amount,
    (aq.quantity*aq.amount) as est_expense,ifnull(sum(me.quantity),0) as purchase_quantity,ifnull(avg(me.amount),0) as purchase_rate,
    ifnull(sum(me.total_amount),0) as site_expense,((aq.quantity*aq.amount)-ifnull(sum(me.total_amount),0)) as escalation_amount")
    .joins("aq 
    left join material_expenses me on aq.material_id=me.material_id
    and me.project_id=aq.project_id
    inner join materials m on m.id=aq.material_id
    inner join material_types mt on mt.id=m.material_type_id
    inner join projects p on p.id=aq.project_id").where("p.is_active=1 and m.is_active=1")
    .group("p.name,m.name,aq.quantity,aq.amount")
    unless c.empty?
      c=c.join(' and ') 
      @escalations = @escalations.where(c).order("p.id")
    end    
    @total=0
  end
end
