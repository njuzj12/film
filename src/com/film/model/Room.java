package com.film.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tb_room")
public class Room extends BaseBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer roomId;
	
	@Column(name = "row")
	private int row;
	@Column(name = "column")
	private int column;
	public Integer getRoomId() {
		return roomId;
	}
	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public int getColumn() {
		return column;
	}
	public void setColumn(int column) {
		this.column = column;
	}
	
	
}
