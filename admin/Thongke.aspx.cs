using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting;
using System.Data;
using System.Data.SqlClient;
public partial class admin_Thongke : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["NV"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            string q = manguoidung();
            // Label1.Text = q;
            if (q.Equals("2"))
            {
                Label2.Text = "Xin chào, Thu Ngân";
            }
            else Label2.Text = "Xin chào, Admin";
        }
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        try
        {
            if (ddrLuachon.SelectedIndex == 1)
            {
                Panel3.Visible = true;
                string txt3 = txtban.Text;
                SqlDataSource dt = new SqlDataSource();
                grDs1.DataSourceID = null;
                dt.ID = "SqlDataSource215";
                dt.ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
                dt.SelectCommand = "select mahoadon,makh,nguoidat ,CONVERT(varchar, ngaythang, 103),diachi,tongtien from HOA_DON where sdt ='" + txt3 + "' or makh ='" + txt3 + "'";
                grDs1.DataSource = dt;
                grDs1.DataBind();
            }

            else if (ddrLuachon.SelectedIndex == 0)
            {
                Panel2.Visible = true;
                string txt2 = txtmamon.Text;
                SqlDataSource dt = new SqlDataSource();
                grDs1.DataSourceID = null;
                dt.ID = "SqlDataSource21";
                dt.ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
                dt.SelectCommand = "select mahoadon,makh,nguoidat ,CONVERT(varchar, ngaythang, 103),diachi,tongtien from HOA_DON where mahoadon in (select mahoadon from CT_HOA_DON where mamonan='" + txt2 + "')";
                grDs1.DataSource = dt;
                grDs1.DataBind();


            }
            else if (ddrLuachon.SelectedIndex == 2)
            {
                Panel4.Visible = true;
                string txt2 = txtmamon.Text;
                SqlDataSource dt = new SqlDataSource();
                
                grDs1.DataSourceID = null;
                dt.ID = "SqlDataSource215";
                dt.ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
                dt.SelectCommand = "select mahoadon,makh,nguoidat ,CONVERT(varchar, ngaythang, 103),diachi,tongtien from HOA_DON where tongtien >'" + ddrtien.SelectedValue.ToString() + "'";
                grDs1.DataSource = dt;
                grDs1.DataBind();


            }

            Panel1.Visible = true;
            Double tien = 0;
            for (Int32 i = 0; i < grDs1.Rows.Count; i++)
            {
                //if ((grDs1.Rows[i].Cells[5].Text).Equals(""))
                  //  tien += 0;
               // else
                tien += Double.Parse(grDs1.Rows[i].Cells[5].Text);

            }
            txtTongtien.Text = tien.ToString();

            txtDoanhthu.Text = grDs1.Rows.Count.ToString();
        }
        catch (Exception ex)
        {
            if (grDs1.Rows.Count < 1)

                Label1.Text = ex.Message;
        }
    }

    protected void ddrLuachon_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (ddrLuachon.SelectedIndex == 1)
            Panel3.Visible = true;
        else if (ddrLuachon.SelectedIndex == 0)
            Panel2.Visible = true;
        else if (ddrLuachon.SelectedIndex == 2)
            Panel4.Visible = true;
    }
    protected void grDs1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddrLuachon_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
             if (ddrLuachon.SelectedIndex == 1)
                Panel3.Visible = true;
             else if (ddrLuachon.SelectedIndex == 0)
                Panel2.Visible = true;
             else if (ddrLuachon.SelectedIndex == 2)
                 Panel4.Visible = true;
        }
    }

    protected void grDs1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = "Mã Hóa Đơn";
            e.Row.Cells[1].Text = "Mã Khách Hàng";
            e.Row.Cells[2].Text = "Người Đặt";
            e.Row.Cells[3].Text = "Ngày Đặt";
            e.Row.Cells[4].Text = "Địa Chỉ";
            e.Row.Cells[5].Text = "Tổng Tiền";
            
        }
        
       
    }
    protected void btnSoluot_Click(object sender, EventArgs e)
    {

    }
    public string manguoidung()
    {
        //Lấy tk đã lưu:
        NguoiDung tk = new NguoiDung();
        tk = (NguoiDung)Session["NV"];
        //truy vấn data:
        string ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
        SqlConnection con = new SqlConnection(ConnectionString);
        con.Open();
        string select = "SELECT quyen FROM NHAN_VIEN WHERE manv=@tk AND matkhau=@mk";
        SqlCommand comand = new SqlCommand(select, con);
        comand.Parameters.AddWithValue("tk", tk.userName);
        comand.Parameters.AddWithValue("mk", tk.password);
        SqlDataReader dataReader = comand.ExecuteReader();
        dataReader.Read();
        string manguoidung = dataReader["quyen"].ToString();
        con.Close();
        return manguoidung;
    }
}