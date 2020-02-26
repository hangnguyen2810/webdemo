using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderInfor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            Label1.Text = email();
        }
        else
        {
            Label1.Text = "";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("DsMonDat.aspx");
    }
    public string email()
    {
        //Lấy tk đã lưu:
        NguoiDung tk = new NguoiDung();
        tk = (NguoiDung)Session["User"];
        string email = tk.userName.ToString();
        return email;
    }
}