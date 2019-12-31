package com.example.demo.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 *  证书类别
 */
@Entity
@Table(name="e_certificate")
public class E_certificate implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "ec_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)  //自增
    private Long id;

    @Column(name = "ec_title_hk")
    private String hk;

    @Column(name = "ec_title_cn")
    private String cn;

    @Column(name = "ec_title_jp")
    private String jp;

    @Column(name = "ec_title_kr")
    private String kr;

    @Column(name = "ec_title_en")
    private String en;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getHk() {
        return hk;
    }

    public void setHk(String hk) {
        this.hk = hk;
    }

    public String getCn() {
        return cn;
    }

    public void setCn(String cn) {
        this.cn = cn;
    }

    public String getEn() {
        return en;
    }

    public void setEn(String en) {
        this.en = en;
    }

    public String getJp() {
        return jp;
    }

    public void setJp(String jp) {
        this.jp = jp;
    }

    public String getKr() {
        return kr;
    }

    public void setKr(String kr) {
        this.kr = kr;
    }
}
