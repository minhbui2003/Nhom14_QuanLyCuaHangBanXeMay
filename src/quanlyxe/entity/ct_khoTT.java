/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quanlyxe.entity;

public class ct_khoTT {

    String CTMaKho, MaKho, MaSP;
    long SoLuong;

    public ct_khoTT(String CTMaKho, String MaKho, String MaSP, long SoLuong) {
        this.CTMaKho = CTMaKho;
        this.MaKho = MaKho;
        this.MaSP = MaSP;
        this.SoLuong = SoLuong;
    }

    public String getCTMaKho() {
        return CTMaKho;
    }

    public void setCTMaKho(String CTMaKho) {
        this.CTMaKho = CTMaKho;
    }

    public String getMaKho() {
        return MaKho;
    }

    public void setMaKho(String MaKho) {
        this.MaKho = MaKho;
    }

    public String getMaSP() {
        return MaSP;
    }

    public void setMaSP(String MaSP) {
        this.MaSP = MaSP;
    }

    public long getSoLuong() {
        return SoLuong;
    }

    public void setSoLuong(long SoLuong) {
        this.SoLuong = SoLuong;
    }

}
