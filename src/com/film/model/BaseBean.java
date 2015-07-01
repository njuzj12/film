
package com.film.model;

import javax.persistence.*;

@MappedSuperclass
public class BaseBean {
	@Version
    private int version;

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}
}
