package com.koitt.tim.dto.point;

import java.sql.Timestamp;

public class PointDto {
	private String id;
	private int point;
	private Timestamp saving;
	private String reason;
	private String o_num;
	private String key2;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Timestamp getSaving() {
		return saving;
	}

	public void setSaving(Timestamp saving) {
		this.saving = saving;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getO_num() {
		return o_num;
	}

	public void setO_num(String o_num) {
		this.o_num = o_num;
	}

	public String getKey2() {
		return key2;
	}

	public void setKey2(String key2) {
		this.key2 = key2;
	}

}
