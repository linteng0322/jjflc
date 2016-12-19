package com.jxf.oa.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;
@Entity
@Table(name = "MATERIALORDER")
public class MaterialOrder extends IdEntity {
	
	
	private Integer id;
	private JXFOrder order;//订单编号
	
	private Material material;//materialid, thinkness, length, color
	private String materialstatus;//已出库？
	
	private String orderMaterialId;
	private Double orderThickness;
	private Double orderLength;
	private String orderColor;
	

    public MaterialOrder() {
    }

    public MaterialOrder(Integer id) {
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
    
    @ManyToOne
    @JoinColumn(name = "ORDERID", nullable = false)
	public JXFOrder getOrder() {
		return order;
	}

	public void setOrder(JXFOrder order) {
		this.order = order;
	}

	@OneToOne
    @JoinColumn(name = "MATERIALID")
	public Material getMaterial() {
		return material;
	}

	public void setMaterial(Material material) {
		this.material = material;
	}
	
	@Column(name = "MATERIALSTATUS")
	public String getMaterialstatus() {
		return materialstatus;
	}

	public void setMaterialstatus(String materialstatus) {
		this.materialstatus = materialstatus;
	}
	
	@Column(name = "ORDERMATERIALID")
	public String getOrderMaterialId() {
		return orderMaterialId;
	}

	public void setOrderMaterialId(String orderMaterialId) {
		this.orderMaterialId = orderMaterialId;
	}
	@Column(name = "ORDERTHICKNESS")
	public Double getOrderThickness() {
		return orderThickness;
	}

	public void setOrderThickness(Double orderThickness) {
		this.orderThickness = orderThickness;
	}
	@Column(name = "ORDERLENGTH")
	public Double getOrderLength() {
		return orderLength;
	}

	public void setOrderLength(Double orderLength) {
		this.orderLength = orderLength;
	}
	@Column(name = "ORDERCOLOR")
	public String getOrderColor() {
		return orderColor;
	}

	public void setOrderColor(String orderColor) {
		this.orderColor = orderColor;
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
		MaterialOrder other = (MaterialOrder) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

   

}
