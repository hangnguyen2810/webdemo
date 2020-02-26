using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_DonHang : System.Web.UI.Page
{
    string conn = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
    SqlConnection con;
    SqlCommand cmd;
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
                Label1.Text = "Xin chào, Thu Ngân";
            }
            else Label1.Text = "Xin chào, Admin";
        }
        if (!IsPostBack)
        {

            lblNgay.Text = DateTime.Now.ToString("dd/MM/yyyy");
            
        }
        lblSL.Text = grDs.Rows.Count.ToString();
        Sua_tien();

        txtngayBD.Attributes["type"] = "Date";
        txtngayKT.Attributes["type"] = "Date";
    }


    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string txt = RadioButtonList1.SelectedValue.ToString();
        SqlDataSource dt = new SqlDataSource();
        grDs.DataSourceID = null;
        dt.ID = "SqlDataSource2";
        dt.ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";

        if (txt.Equals("Tất cả"))
        {
            dt.SelectCommand = "SELECT * FROM [HOA_DON] WHERE [trangthai] like N'Ship_%' and CONVERT(varchar, ngaythang, 103)= CONVERT(varchar, GETDATE(), 103)";

        }
        else
        {
            dt.SelectCommand = "SELECT * FROM [HOA_DON] WHERE [trangthai] = N'" + txt + "' and CONVERT(varchar, ngaythang, 103)= CONVERT(varchar, GETDATE(), 103)";

        }
        grDs.DataSource = dt;
        grDs.DataBind();
        lblSL.Text = grDs.Rows.Count.ToString();
    }
    public void Sua_tien()
    {
        con = new SqlConnection(conn);
        con.Open();
        string sql = "update HOA_DON set tongtien=0 where trangthai=N'Ship_Hủy'";
        cmd = new SqlCommand(sql, con);
        cmd.ExecuteNonQuery();
        con.Close();

    }

    protected void loc_Click(object sender, EventArgs e)
    {
         SqlDataSource dt = new SqlDataSource();
        grDs.DataSourceID = null;
        dt.ID = "SqlDataSource16";
        string txt = RadioButtonList1.SelectedValue.ToString();
        dt.ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
        if (txt.Equals("Tất cả") || txt.Equals(""))
        {
            dt.SelectCommand = "SELECT * FROM [HOA_DON] WHERE [trangthai] like N'Ship_%' and  ngaythang >= '" + txtngayBD.Text + "' and ngaythang <= '" + txtngayKT.Text + "'";

        }
        else
        {
            dt.SelectCommand = "SELECT * FROM [HOA_DON] WHERE [trangthai] = N'" + txt + "' and  ngaythang >= '" + txtngayBD.Text + "' and ngaythang <= '" + txtngayKT.Text + "'";

        }
        grDs.DataSource = dt;
        grDs.DataBind();
        lblSL.Text = grDs.Rows.Count.ToString();
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