using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterpageDangNhap : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RandomImages();
        }
    }

    private void RandomImages()
    {
        Random r = new Random();
        int n = r.Next(1, 5);
        img.ImageUrl = "~/anhmonan/slide" + n + ".jpg";
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        RandomImages();
    }
}
