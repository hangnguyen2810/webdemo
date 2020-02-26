using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ShoppingCart
/// </summary>
public class ShoppingCart
{
    public List<CartItem> Items { get; set; }
    //Khai bao Property tongTien chi doc
    private decimal _tongTien;
    public decimal TongTien
    {
        get
        {
            _tongTien = 0;
            if (Items != null)
            {
                foreach (var item in Items)
                {
                    _tongTien += item.ThanhTien;
                }
            }
            return _tongTien;
        }
    }
	public ShoppingCart()
	{
        if (this.Items == null)
        {
            //Neu chua co mat hang nao thi tao gio rong
            this.Items = new List<CartItem>();
        }
	}
    //Xac dinh vi tri cua mat hang trong gio
    public int getIndex(string ma)
    {
        int index = 0;
        foreach (var item in this.Items)
        {
            if (item.mamon == ma)
            {
                //Tim thay mat hang trong gio
                return index;
            }
            index++;
        }
        return -1;//khong tim thay mat hang trong gio
            
    }
    //Them mot mat hang vao gio
    public void InsertItem(string ma, string ten, decimal gia, int soluong)
    {
        //Xac dinh vi tri mat hang trong gio
        int index = this.getIndex(ma);
        if (index == -1)//Chua co mat hang nay trong gio
        {
            //Tao 1 CartItem moi
            CartItem anItem = new CartItem(ma, ten, gia, soluong);
            //Them CartItem moi vao danh sach Items cac mat hang trong gio
            Items.Add(anItem);
        }
        else//Neu da co mat hang trong gio
        {
            //Tang so luong cua mat hang nay
            Items[index].soluong += soluong;

        }
    }
    //Xoa 1 mat hang khoi gio
    public void DeleteItem(int rowID)
    {
        Items.RemoveAt(rowID);
    }
    //Cap nhat so luong hang
    public void UpdateItem(int rowID, int soluong)
    {
        if (soluong == 0)
        {
            //Xoa mat hang khoi gio
            DeleteItem(rowID);
        }
        else
        {
            //Lay mat hang can sua
            CartItem updateItem = Items[rowID];
            //Sua so luong;
            updateItem.soluong = soluong;
        }
    }

}