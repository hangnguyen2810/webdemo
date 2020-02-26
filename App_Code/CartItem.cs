using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CartItem
/// </summary>
public class CartItem
{
    public string mamon { get; set; }
    public string tenmon { get; set; }
    public decimal gia { get; set; }
    public int soluong { get; set; }
    //khai bao thuoc tinh Thanh tien chi doc
    public decimal _thanhTien;
    public decimal ThanhTien
    {
        get
        {
            _thanhTien = gia * soluong;
            return _thanhTien;
        }
    }


    public CartItem(string ma, string ten, decimal gia, int soluong)
	{
        this.mamon = ma;
        this.tenmon = ten;
        this.gia = gia;
        this.soluong = soluong;
	}
}