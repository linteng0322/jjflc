package com.jxf.oa.entity;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name = "JXFORDER")
public class JXFOrder extends IdEntity {
	
	private Integer id;
	private String orderId;//auto generated based on time;
	private Customer customer;
	private Double calweight;//estimated weight of the whole order
	private Double actweight;//actual weight of the whole order
	private ArrayList<MaterialOrder> materialorderlist;
    public JXFOrder() {
    }

    public JXFOrder(Integer id) {
        this.id = id;
    }

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    @Column(name = "ORDERID")
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	@ManyToOne
	@JoinColumn(name = "CUSTOMERID", nullable = false)
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Column(name = "CALWEIGHT")
	public Double getCalweight() {
		return calweight;
	}

	public void setCalweight(Double calweight) {
		this.calweight = calweight;
	}

	@Column(name = "ACTWEIGHT")
	public Double getActweight() {
		return actweight;
	}

	public void setActweight(Double actweight) {
		this.actweight = actweight;
	}

	public ArrayList<MaterialOrder> getMaterialorderlist() {
		return materialorderlist;
	}

	public void setMaterialorderlist(ArrayList<MaterialOrder> materialorderlist) {
		this.materialorderlist = materialorderlist;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		JXFOrder other = (JXFOrder) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

   

}
