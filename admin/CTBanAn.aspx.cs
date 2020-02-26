using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class admin_CTBanAn : System.Web.UI.Page
{
    string conn = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    String id;
    String idmon;
    String mahoadon;

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
                Label6.Text = "Xin chào, Thu Ngân";
            }
            else Label6.Text = "Xin chào, Admin";
        
        }
        con = new SqlConnection(conn);
        con.Open();
        if (!IsPostBack)
        {
            id = ddrLoai.SelectedValue.ToString();
            idmon = ddrMon.SelectedValue.ToString();
            Showloai();
            LoadMon();
            showgia();
            ShowNV();
            txtSL.Text = "1";

        }

        lblLich.Text = "Hôm nay: " + DateTime.Now.ToString("dd/MM/yyyy");
        // Show_order();
        // Show_tien();
        txtSL.Attributes["type"] = "number";
        txtDT.Attributes["type"] = "phone";

    }
    protected void ddrLoai_SelectedIndexChanged(object sender, EventArgs e)
    {

        id = ddrLoai.SelectedValue.ToString();

        LoadMon();

    }
    public void Showloai()
    {

        string sql = "select * from LOAI_MON_AN";
        cmd = new SqlCommand(sql, con);
        dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        ddrLoai.DataSource = dt;
        ddrLoai.DataValueField = "maloaimonan";
        ddrLoai.DataTextField = "tenloaimonan";
        ddrLoai.DataBind();

    }
    public void LoadMon()
    {

        string sql = "select * from MON_AN where maloaimonan='" + id + "'";
        cmd = new SqlCommand(sql, con);
        dr = cmd.ExecuteReader();
        DataTable dt2 = new DataTable();
        dt2.Load(dr);
        ddrMon.DataSource = dt2;
        ddrMon.DataValueField = "mamonan";
        ddrMon.DataTextField = "tenmonan";
        ddrMon.DataBind();

    }
    public void showgia()
    {

        string sql = "select gia from MON_AN where mamonan='" + idmon + "'";
        cmd = new SqlCommand(sql, con);
        dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        ddrGia.DataSource = dt;
        ddrGia.DataTextField = "gia";
        ddrGia.DataBind();
    }
    public void ShowNV()
    {

        string sql = "select * from NHAN_VIEN where quyen='2'";
        cmd = new SqlCommand(sql, con);
        dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        ddrthungan.DataSource = dt;
        ddrthungan.DataValueField = "manv";
        ddrthungan.DataTextField = "tennv";
        ddrthungan.DataBind();
    }
    public void Show_tien()
    {
        GridView1.DataBind();
        Double tien = 0;
        for (Int32 i = 0; i < GridView1.Rows.Count; i++)
        {
            tien += Double.Parse(GridView1.Rows[i].Cells[7].Text);


        }
        lblTong.Text = tien.ToString();
        // set_thanhtien();

    }
    protected void ddrMon_SelectedIndexChanged(object sender, EventArgs e)
    {

        idmon = ddrMon.SelectedValue.ToString();
        showgia();
    }

    public void suaban_1()
    {
        string sql = "update BAN_AN set trangthai=1 where maban='" + DetailsView1.Rows[0].Cells[1].Text + "'";

        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.ExecuteNonQuery();
    }
    public void suaban_0()
    {
        string sql = "update BAN_AN set trangthai='0' where maban in (select maban from HOA_DON inner join CT_HOA_DON on HOA_DON.mahoadon=CT_HOA_DON.mahoadon where trangthai=N'Đang ăn' and HOA_DON.mahoadon='" + GridView1.Rows[0].Cells[0].Text + "')";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.ExecuteNonQuery();
    }
    public void set_thanhtien()
    {
        string sql = "update HOA_DON set tongtien='" + lblTong.Text + "' where mahoadon='" + GridView1.Rows[0].Cells[0].Text + "'";

        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.ExecuteNonQuery();
    }
    public void Xoa_hdon()
    {
        string sql1 = "delete from HOA_DON where mahoadon not in (select mahoadon from CT_HOA_DON) and hinhthucthanhtoan=N'Thanh toán tại nhà hàng'";
        SqlCommand cmd1 = new SqlCommand(sql1, con);
        cmd1.ExecuteNonQuery();
    }
    public void Update_dattruoc()
    {
        string sql = "update HOA_DON set trangthai=N'Đang ăn',manv='" + ddrthungan.SelectedValue.ToString() + "' where mahoadon='" + txtmahd.Text + "'";

        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.ExecuteNonQuery();
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        if (radiodatban.Checked)
        {

            Update_dattruoc();
            txtmahd.Visible = true;
            try
            {
                //Chen 1 dong vao bang don hang

                if (GridView1.Rows.Count == 0)
                {
                    SqlDsDonhang.Insert();


                    //Chen cac chi tiet don hang vao bang chi tiet hoa don bang vong lap 
                    SqlChitiet.InsertParameters["mahoadon"].DefaultValue = txtmahd.Text;
                    SqlChitiet.InsertParameters["maban"].DefaultValue = DetailsView1.Rows[0].Cells[1].Text;
                    SqlChitiet.InsertParameters["mamonan"].DefaultValue = ddrMon.SelectedValue.ToString();
                    SqlChitiet.InsertParameters["soluong"].DefaultValue = txtSL.Text;

                }
                else
                {
                    SqlChitiet.InsertParameters["mahoadon"].DefaultValue = GridView1.Rows[0].Cells[0].Text;
                    SqlChitiet.InsertParameters["maban"].DefaultValue = DetailsView1.Rows[0].Cells[1].Text;
                    SqlChitiet.InsertParameters["mamonan"].DefaultValue = ddrMon.SelectedValue.ToString();
                    SqlChitiet.InsertParameters["soluong"].DefaultValue = txtSL.Text;

                }

                //Chen 1 dong vao bang chi tiet hoa don
                SqlChitiet.Insert();

                // hien thi thong bao thanh toan thanh cong
                GridView1.DataBind();
                Show_tien();

                set_thanhtien();
                suaban_1();

                lblThongBao.Text = "Đã Thêm Món! ";
                //lblThongBao.Text = "Thanh Toán thành công !";
            }
            catch (SqlException)
            {
                lblThongBao.Text = "Món đã có trong Order! ";
            }

            catch (Exception ex)
            {
                //hien thi thong bao khong thanh cong
                lblThongBao.Text = "Đặt món ăn thất bại.Lỗi: " + ex.Message;
            }
        }
        else
        {
            SqlDsDonhang.InsertParameters["makh"].DefaultValue = "";
            SqlDsDonhang.InsertParameters["ngaythang"].DefaultValue = DateTime.Now.ToShortDateString();
            SqlDsDonhang.InsertParameters["manv"].DefaultValue = ddrthungan.SelectedValue.ToString();
            SqlDsDonhang.InsertParameters["sdt"].DefaultValue = txtDT.Text;
            SqlDsDonhang.InsertParameters["diachi"].DefaultValue = txtDC.Text;
            SqlDsDonhang.InsertParameters["tongtien"].DefaultValue = lblTong.Text;
            SqlDsDonhang.InsertParameters["nguoidat"].DefaultValue = txtHt.Text;
            SqlDsDonhang.InsertParameters["hinhthucthanhtoan"].DefaultValue = "Thanh toán tại nhà hàng";
            SqlDsDonhang.InsertParameters["trangthai"].DefaultValue = "Đang Ăn";
            SqlDsDonhang.InsertParameters["chuthich"].DefaultValue = "";

            try
            {
                //Chen 1 dong vao bang don hang

                if (GridView1.Rows.Count == 0)
                {
                    SqlDsDonhang.Insert();


                    //Chen cac chi tiet don hang vao bang chi tiet hoa don bang vong lap 
                    SqlChitiet.InsertParameters["mahoadon"].DefaultValue = mahoadon;
                    SqlChitiet.InsertParameters["maban"].DefaultValue = DetailsView1.Rows[0].Cells[1].Text;
                    SqlChitiet.InsertParameters["mamonan"].DefaultValue = ddrMon.SelectedValue.ToString();
                    SqlChitiet.InsertParameters["soluong"].DefaultValue = txtSL.Text;

                }
                else
                {
                    SqlChitiet.InsertParameters["mahoadon"].DefaultValue = GridView1.Rows[0].Cells[0].Text;
                    SqlChitiet.InsertParameters["maban"].DefaultValue = DetailsView1.Rows[0].Cells[1].Text;
                    SqlChitiet.InsertParameters["mamonan"].DefaultValue = ddrMon.SelectedValue.ToString();
                    SqlChitiet.InsertParameters["soluong"].DefaultValue = txtSL.Text;

                }

                //Chen 1 dong vao bang chi tiet hoa don
                SqlChitiet.Insert();

                // hien thi thong bao thanh toan thanh cong
                GridView1.DataBind();
                Show_tien();

                set_thanhtien();
                suaban_1();

                lblThongBao.Text = "Đã Thêm Món! ";
                //lblThongBao.Text = "Thanh Toán thành công !";
            }
            catch (SqlException)
            {
                lblThongBao.Text = "Món đã có trong Order! ";
            }

            catch (Exception ex)
            {
                //hien thi thong bao khong thanh cong
                lblThongBao.Text = "Đặt món ăn thất bại.Lỗi: " + ex.Message;
            }
        }
    }

    protected void SqlDsDonhang_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        mahoadon = e.Command.Parameters["@mahoadon"].Value.ToString();
    }

    protected void btnThanhtoan_Click(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count == 0)
        {
            Response.Write("<script>alert('Chưa Order Món!')</script>");
        }
        try
        {
            Xemtt();
            suaban_0();
            Xoa_hdon();
            //set_hd();
            //Show_tien();
            string sql = "update HOA_DON set trangthai='Hoàn thành' where mahoadon='" + GridView1.Rows[0].Cells[0].Text + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            lblThongBao.Text = "Thanh toán thành công!";
        }
        catch (Exception ex)
        {
            lblThongBao.Text = "Có lỗi xảy ra" + ex.Message;
        }


    }
    public void Show_order()
    {
        SqlDataSource dt = new SqlDataSource();
        GridView1.DataSourceID = null;
        dt.ID = "SqlDataSource215";
        dt.ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
        dt.SelectCommand = "select HOA_DON.mahoadon, machitiet,maban,CT_HOA_DON.mamonan,tenmonan,soluong,gia,soluong*gia as 'Thành tiền' from CT_HOA_DON inner join MON_AN on CT_HOA_DON.mamonan=MON_AN.mamonan inner join HOA_DON on HOA_DON.mahoadon=CT_HOA_DON.mahoadon where maban='" + DetailsView1.Rows[0].Cells[1].Text + "'and trangthai=N'Đang ăn'";
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void ddrLoai_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            id = ddrLoai.SelectedValue.ToString();
            LoadMon();
            showgia();
        }
    }
    protected void ddrMon_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            idmon = ddrMon.SelectedValue.ToString();
            showgia();

        }

    }

    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        Show_tien();
        set_thanhtien();
        //set_hd();

    }
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        Show_tien();
        set_thanhtien();
        //set_hd();
        //set_hd1();
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
    public void Xemtt()
    {
        SqlDataSource dt = new SqlDataSource();
        GridView1.DataSourceID = null;
        dt.ID = "SqlDataSource14";
        dt.ConnectionString = @"Data Source=ABTT-20190713MZ\SQLEXPRESS;Initial Catalog=NHAHANG19;Integrated Security=True";
        dt.SelectCommand = "select HOA_DON.mahoadon, machitiet,maban,CT_HOA_DON.mamonan,tenmonan,soluong,gia,soluong*gia as 'Thành tiền' from CT_HOA_DON inner join MON_AN on CT_HOA_DON.mamonan=MON_AN.mamonan inner join HOA_DON on HOA_DON.mahoadon=CT_HOA_DON.mahoadon WHERE HOA_DON.mahoadon='" + GridView1.Rows[0].Cells[0].Text + "' and trangthai=N'Đang ăn'";
        GridView1.DataSource = dt;
        GridView1.DataBind();
        Show_tien();
        set_thanhtien();
    }
    protected void btnXem_Click(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count == 0)
        {
            Response.Write("<script>alert('Chưa Order Món!')</script>");
        }
        else
        {
            Xemtt();
        }
    }

    protected void SqlDsDonhang_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        mahoadon = e.Command.Parameters["@mahoadon"].Value.ToString();
    }
    protected void btncapnhat_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = "update HOA_DON set nguoidat=N'" + txtHt.Text + "',sdt='" + txtDT.Text + "',diachi=N'" + txtDC.Text + "' where mahoadon='" + GridView1.Rows[0].Cells[0].Text + "'";

            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.ExecuteNonQuery();
            lblThongBao.Text = "Cập nhật thông tin khách hàng thành công!";
        }
        catch (Exception)
        {
            lblThongBao.Text = "Chưa có hóa đơn";
        }

    }
}